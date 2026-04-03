from flask import Flask, flash, redirect, render_template, request, session, url_for
import requests
import mysql.connector
import os
from dotenv import load_dotenv

app = Flask(__name__)

load_dotenv()
app.secret_key = os.getenv("FLASK_SECRET_KEY", "weather-advisor-dev")
DB_USER = os.getenv("DB_USER")
DB_PASS = os.getenv("DB_PASS")

db = mysql.connector.connect(
    host="localhost",
    user=DB_USER,
    password=DB_PASS,
    database="weather_app"
)

API_KEY = os.getenv("API_KEY")


def get_empty_summary():
    return {
        "total_checks": 0,
        "unique_cities": 0,
        "avg_temp_c": None,
        "peak_uv": None,
        "max_wind_mps": None
    }


def serialize_datetime(value, fmt="%d %b %Y %H:%M"):
    if value is None:
        return None
    return value.strftime(fmt)


def build_theme(condition, uv_index, wind_speed, humidity):
    theme = "default"
    if condition == "Rain":
        theme = "rain"
    elif condition == "Clouds":
        theme = "clouds"
    elif condition == "Clear":
        theme = "clear"

    if uv_index is not None and uv_index >= 8:
        return "uv"
    if wind_speed is not None and wind_speed >= 10:
        return "wind"
    if humidity is not None and humidity >= 75:
        return "humid"
    return theme


def group_recommendations(rows):
    grouped = {}
    for row in rows:
        category = row["category_name"]
        text = row["recommendation_text"]
        if category not in grouped:
            grouped[category] = []
        if text not in grouped[category]:
            grouped[category].append(text)
    return grouped


def serialize_city_comparison(comparison):
    if not comparison:
        return None

    city_profile = comparison.get("city_profile") or {}
    reference = comparison.get("reference") or {}

    return {
        "reference_label": comparison.get("reference_label"),
        "summary_lines": comparison.get("summary_lines", []),
        "weekly_lines": comparison.get("weekly_lines", []),
        "profile_lines": comparison.get("profile_lines", []),
        "city_profile": {
            "total_checks": city_profile.get("total_checks"),
            "avg_temp_c": city_profile.get("avg_temp_c"),
            "coolest_temp_all": city_profile.get("coolest_temp_all"),
            "hottest_temp_all": city_profile.get("hottest_temp_all"),
            "first_seen": serialize_datetime(city_profile.get("first_seen"), "%d %b %Y"),
            "last_seen": serialize_datetime(city_profile.get("last_seen"), "%d %b %Y")
        } if city_profile else None,
        "reference": {
            "condition_main": reference.get("condition_main"),
            "temp_c": reference.get("temp_c"),
            "observed_at": serialize_datetime(reference.get("observed_at"))
        } if reference else None
    }


def store_latest_search(result):
    session["latest_weather"] = result["weather"]
    session["latest_recommendations"] = result["recommendations"]
    session["latest_city_comparison"] = result["city_comparison"]


def get_recent_observations(limit=5):
    cursor = db.cursor(dictionary=True)
    cursor.execute("""
        SELECT
            observation_id,
            city,
            country_code,
            observed_at,
            temp_c,
            humidity_pct,
            wind_speed_mps,
            uv_index,
            condition_main
        FROM weather_observations
        ORDER BY observed_at DESC
        LIMIT %s
    """, (limit,))
    rows = cursor.fetchall()
    cursor.close()
    return rows


def get_recommendation_management_data():
    cursor = db.cursor(dictionary=True)
    cursor.execute("""
        SELECT condition_id, condition_name
        FROM weather_conditions
        ORDER BY priority DESC, condition_name ASC
    """)
    conditions = cursor.fetchall()

    cursor.execute("""
        SELECT category_id, category_name
        FROM recommendation_categories
        ORDER BY category_name ASC
    """)
    categories = cursor.fetchall()

    cursor.execute("""
        SELECT
            r.recommendation_id,
            wc.condition_name,
            c.category_name,
            r.recommendation_text
        FROM recommendations r
        JOIN weather_conditions wc
            ON r.condition_id = wc.condition_id
        JOIN recommendation_categories c
            ON r.category_id = c.category_id
        ORDER BY wc.priority DESC, wc.condition_name ASC, c.category_name ASC, r.recommendation_id ASC
    """)
    recommendations = cursor.fetchall()
    cursor.close()

    return conditions, categories, recommendations


def get_observation_summary():
    cursor = db.cursor(dictionary=True)
    cursor.execute("""
        SELECT
            COUNT(*) AS total_checks,
            COUNT(DISTINCT city) AS unique_cities,
            ROUND(AVG(temp_c), 1) AS avg_temp_c,
            ROUND(MAX(uv_index), 1) AS peak_uv,
            ROUND(MAX(wind_speed_mps), 1) AS max_wind_mps
        FROM weather_observations
    """)
    summary = cursor.fetchone() or get_empty_summary()

    cursor.execute("""
        SELECT city, COUNT(*) AS checks
        FROM weather_observations
        GROUP BY city
        ORDER BY checks DESC, city ASC
        LIMIT 3
    """)
    top_cities = cursor.fetchall()
    cursor.close()

    return summary, top_cities


def get_city_comparison(city, temp, humidity, wind_speed, uv_index):
    cursor = db.cursor(dictionary=True)
    cursor.execute("""
        SELECT
            observed_at,
            temp_c,
            humidity_pct,
            wind_speed_mps,
            uv_index,
            condition_main
        FROM weather_observations
        WHERE LOWER(city) = LOWER(%s)
        AND DATE(observed_at) = CURDATE() - INTERVAL 1 DAY
        ORDER BY observed_at DESC
        LIMIT 1
    """, (city,))
    yesterday = cursor.fetchone()

    cursor.execute("""
        SELECT
            observed_at,
            temp_c,
            humidity_pct,
            wind_speed_mps,
            uv_index,
            condition_main
        FROM weather_observations
        WHERE LOWER(city) = LOWER(%s)
        ORDER BY observed_at DESC
        LIMIT 1
    """, (city,))
    latest_previous = cursor.fetchone()

    cursor.execute("""
        SELECT
            COUNT(*) AS observations,
            MAX(temp_c) AS hottest_temp,
            MIN(temp_c) AS coolest_temp,
            MAX(wind_speed_mps) AS max_wind_speed,
            MAX(uv_index) AS max_uv_index
        FROM weather_observations
        WHERE LOWER(city) = LOWER(%s)
        AND observed_at >= NOW() - INTERVAL 7 DAY
    """, (city,))
    weekly = cursor.fetchone()

    cursor.execute("""
        SELECT
            COUNT(*) AS total_checks,
            MIN(observed_at) AS first_seen,
            MAX(observed_at) AS last_seen,
            ROUND(AVG(temp_c), 1) AS avg_temp_c,
            ROUND(AVG(humidity_pct), 1) AS avg_humidity_pct,
            ROUND(AVG(wind_speed_mps), 1) AS avg_wind_speed_mps,
            ROUND(AVG(uv_index), 1) AS avg_uv_index,
            MAX(temp_c) AS hottest_temp_all,
            MIN(temp_c) AS coolest_temp_all
        FROM weather_observations
        WHERE LOWER(city) = LOWER(%s)
    """, (city,))
    city_profile = cursor.fetchone()
    cursor.close()

    reference = yesterday or latest_previous
    if not reference:
        return None

    def get_time_of_day(observed_at):
        hour = observed_at.hour
        if 5 <= hour < 12:
            return "morning"
        if 12 <= hour < 17:
            return "afternoon"
        if 17 <= hour < 21:
            return "evening"
        return "night"

    def get_reference_label(observed_at, is_yesterday):
        time_of_day = get_time_of_day(observed_at)
        if is_yesterday:
            return f"yesterday {time_of_day}"
        return f"your last saved check from {observed_at.strftime('%A')} {time_of_day}"

    def metric_delta(current_value, previous_value):
        if current_value is None or previous_value is None:
            return None
        return round(current_value - previous_value, 1)

    def build_phrase(delta, unit, positive_text, negative_text, same_text):
        if delta is None:
            return None
        if delta > 0:
            return f"{abs(delta)}{unit} {positive_text}"
        if delta < 0:
            return f"{abs(delta)}{unit} {negative_text}"
        return same_text

    reference_label = get_reference_label(reference["observed_at"], yesterday is not None)

    comparison = {
        "reference_label": reference_label,
        "reference": reference,
        "temp_delta": metric_delta(temp, reference["temp_c"]),
        "humidity_delta": metric_delta(humidity, reference["humidity_pct"]),
        "wind_delta": metric_delta(wind_speed, reference["wind_speed_mps"]),
        "uv_delta": metric_delta(uv_index, reference["uv_index"]),
        "city_profile": city_profile
    }

    comparison["summary_lines"] = [
        build_phrase(comparison["temp_delta"], "°C", f"hotter than {comparison['reference_label']}", f"cooler than {comparison['reference_label']}", f"the same temperature as {comparison['reference_label']}"),
        build_phrase(comparison["humidity_delta"], "%", f"more humid than {comparison['reference_label']}", f"less humid than {comparison['reference_label']}", f"the same humidity as {comparison['reference_label']}"),
        build_phrase(comparison["wind_delta"], " m/s", f"windier than {comparison['reference_label']}", f"calmer than {comparison['reference_label']}", f"the same wind speed as {comparison['reference_label']}"),
        build_phrase(comparison["uv_delta"], "", f"higher UV than {comparison['reference_label']}", f"lower UV than {comparison['reference_label']}", f"the same UV index as {comparison['reference_label']}")
    ]
    comparison["summary_lines"] = [line for line in comparison["summary_lines"] if line]

    weekly_lines = []
    if weekly and weekly["observations"]:
        if temp is not None and weekly["hottest_temp"] is not None:
            if temp > weekly["hottest_temp"]:
                weekly_lines.append("This is hotter than any saved reading from the last 7 days.")
            elif temp == weekly["hottest_temp"]:
                weekly_lines.append("This matches the hottest saved reading from the last 7 days.")
            elif temp < weekly["coolest_temp"]:
                weekly_lines.append("This is cooler than any saved reading from the last 7 days.")
            elif temp == weekly["coolest_temp"]:
                weekly_lines.append("This matches the coolest saved reading from the last 7 days.")

        if wind_speed is not None and weekly["max_wind_speed"] is not None:
            if wind_speed > weekly["max_wind_speed"]:
                weekly_lines.append("This is the windiest saved reading for the last 7 days.")
            elif wind_speed == weekly["max_wind_speed"]:
                weekly_lines.append("This matches the strongest saved wind in the last 7 days.")

        if uv_index is not None and weekly["max_uv_index"] is not None:
            if uv_index > weekly["max_uv_index"]:
                weekly_lines.append("This is the highest saved UV level in the last 7 days.")
            elif uv_index == weekly["max_uv_index"]:
                weekly_lines.append("This matches the highest saved UV level in the last 7 days.")

    comparison["weekly_lines"] = weekly_lines

    profile_lines = []
    if city_profile and city_profile["total_checks"]:
        profile_lines.append(f"{city_profile['total_checks']} saved checks for {city.title()}.")
        if city_profile["avg_temp_c"] is not None:
            profile_lines.append(f"Saved average temperature is {city_profile['avg_temp_c']}°C.")
        if city_profile["hottest_temp_all"] is not None and city_profile["coolest_temp_all"] is not None:
            profile_lines.append(
                f"Recorded range runs from {city_profile['coolest_temp_all']}°C to {city_profile['hottest_temp_all']}°C."
            )

    comparison["profile_lines"] = profile_lines

    return comparison


def get_search_history(selected_id=None, limit=40):
    cursor = db.cursor(dictionary=True)
    cursor.execute("""
        SELECT
            observation_id,
            city,
            country_code,
            observed_at,
            temp_c,
            condition_main,
            humidity_pct,
            wind_speed_mps,
            uv_index
        FROM weather_observations
        ORDER BY observed_at DESC
        LIMIT %s
    """, (limit,))
    observations = cursor.fetchall()

    if not observations:
        cursor.close()
        return [], None

    selected_observation_id = selected_id or observations[0]["observation_id"]

    cursor.execute("""
        SELECT
            observation_id,
            city,
            country_code,
            observed_at,
            temp_c,
            feels_like_c,
            humidity_pct,
            pressure_hpa,
            wind_speed_mps,
            wind_gust_mps,
            wind_deg,
            visibility_m,
            clouds_pct,
            rain_1h_mm,
            rain_3h_mm,
            snow_1h_mm,
            snow_3h_mm,
            condition_main,
            condition_desc,
            uv_index,
            lat,
            lon,
            source
        FROM weather_observations
        WHERE observation_id = %s
    """, (selected_observation_id,))
    selected_observation = cursor.fetchone()

    if not selected_observation:
        selected_observation_id = observations[0]["observation_id"]
        cursor.execute("""
            SELECT
                observation_id,
                city,
                country_code,
                observed_at,
                temp_c,
                feels_like_c,
                humidity_pct,
                pressure_hpa,
                wind_speed_mps,
                wind_gust_mps,
                wind_deg,
                visibility_m,
                clouds_pct,
                rain_1h_mm,
                rain_3h_mm,
                snow_1h_mm,
                snow_3h_mm,
                condition_main,
                condition_desc,
                uv_index,
                lat,
                lon,
                source
            FROM weather_observations
            WHERE observation_id = %s
        """, (selected_observation_id,))
        selected_observation = cursor.fetchone()

    cursor.close()
    return observations, selected_observation


def fetch_weather_result(city):
    weather_url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}&units=metric"
    response = requests.get(weather_url).json()

    if "main" not in response:
        raise ValueError("Invalid city or API error. Please try again.")

    weather = {
        "city": city,
        "country_code": response.get("sys", {}).get("country"),
        "temp": response["main"]["temp"],
        "feels_like": response["main"].get("feels_like"),
        "humidity": response["main"].get("humidity"),
        "pressure": response["main"].get("pressure"),
        "rain": response.get("rain", {}).get("1h", 0),
        "condition": response.get("weather", [{}])[0].get("main", "Clear"),
        "condition_desc": response.get("weather", [{}])[0].get("description"),
        "wind_speed": response.get("wind", {}).get("speed"),
        "wind_gust": response.get("wind", {}).get("gust"),
        "wind_deg": response.get("wind", {}).get("deg"),
        "visibility": response.get("visibility"),
        "clouds": response.get("clouds", {}).get("all"),
        "lat": response.get("coord", {}).get("lat"),
        "lon": response.get("coord", {}).get("lon"),
        "uv_index": None
    }

    if weather["lat"] is not None and weather["lon"] is not None:
        uv_url = (
            "https://api.openweathermap.org/data/3.0/onecall"
            f"?lat={weather['lat']}&lon={weather['lon']}&exclude=minutely,hourly,daily,alerts&appid={API_KEY}"
        )
        uv_response = requests.get(uv_url).json()
        if isinstance(uv_response, dict):
            if "current" in uv_response and "uvi" in uv_response["current"]:
                weather["uv_index"] = uv_response["current"]["uvi"]
            elif "uvi" in uv_response:
                weather["uv_index"] = uv_response["uvi"]

    humidity_val = weather["humidity"] if weather["humidity"] is not None else 0
    wind_speed_val = weather["wind_speed"] if weather["wind_speed"] is not None else 0
    uv_index_val = weather["uv_index"] if weather["uv_index"] is not None else 0

    cursor = db.cursor(dictionary=True)
    try:
        cursor.execute("""
            SELECT condition_id, condition_name
            FROM weather_conditions
            WHERE %s BETWEEN min_temp AND max_temp
            AND %s BETWEEN min_rain AND max_rain
            AND %s BETWEEN min_humidity AND max_humidity
            AND %s BETWEEN min_wind AND max_wind
            AND %s BETWEEN min_uv AND max_uv
            AND is_extreme = 0
            ORDER BY priority DESC
        """, (weather["temp"], weather["rain"], humidity_val, wind_speed_val, uv_index_val))
        matched_conditions = cursor.fetchall()

        if not matched_conditions:
            cursor.execute("""
                SELECT condition_id, condition_name
                FROM weather_conditions
                WHERE is_extreme = 1
                LIMIT 1
            """)
            fallback = cursor.fetchone()
            matched_conditions = [fallback] if fallback else []

        condition_ids = [row["condition_id"] for row in matched_conditions]
        weather["matched_conditions"] = [row["condition_name"] for row in matched_conditions]

        placeholders = ",".join(["%s"] * len(condition_ids))
        cursor.execute(f"""
            SELECT c.category_name, r.recommendation_text
            FROM recommendations r
            JOIN recommendation_categories c
                ON r.category_id = c.category_id
            WHERE r.condition_id IN ({placeholders})
        """, tuple(condition_ids))
        grouped_recommendations = group_recommendations(cursor.fetchall())

        weather["theme"] = build_theme(
            weather["condition"],
            weather["uv_index"],
            weather["wind_speed"],
            weather["humidity"]
        )

        comparison = get_city_comparison(
            city=city,
            temp=weather["temp"],
            humidity=weather["humidity"],
            wind_speed=weather["wind_speed"],
            uv_index=weather["uv_index"]
        )

        cursor.execute("""
            INSERT INTO weather_observations (
                city, country_code, observed_at, temp_c, feels_like_c, humidity_pct, pressure_hpa,
                wind_speed_mps, wind_gust_mps, wind_deg, visibility_m, clouds_pct,
                rain_1h_mm, rain_3h_mm, snow_1h_mm, snow_3h_mm,
                condition_main, condition_desc, uv_index, lat, lon
            )
            VALUES (
                %s, %s, NOW(), %s, %s, %s, %s,
                %s, %s, %s, %s, %s,
                %s, %s, %s, %s,
                %s, %s, %s, %s, %s
            )
        """, (
            city,
            weather["country_code"],
            weather["temp"],
            weather["feels_like"],
            weather["humidity"],
            weather["pressure"],
            weather["wind_speed"],
            weather["wind_gust"],
            weather["wind_deg"],
            weather["visibility"],
            weather["clouds"],
            response.get("rain", {}).get("1h"),
            response.get("rain", {}).get("3h"),
            response.get("snow", {}).get("1h"),
            response.get("snow", {}).get("3h"),
            weather["condition"],
            weather["condition_desc"],
            weather["uv_index"],
            weather["lat"],
            weather["lon"]
        ))
        db.commit()
    finally:
        cursor.close()

    return {
        "weather": weather,
        "recommendations": grouped_recommendations,
        "city_comparison": serialize_city_comparison(comparison)
    }


@app.route("/recommendations/add", methods=["POST"])
def add_recommendation():
    condition_id = request.form.get("condition_id", type=int)
    category_id = request.form.get("category_id", type=int)
    recommendation_text = (request.form.get("recommendation_text") or "").strip()

    if not condition_id or not category_id or not recommendation_text:
        flash("Choose a condition, choose a category, and enter recommendation text.", "error")
        return redirect(url_for("manage_recommendations"))

    cursor = db.cursor(dictionary=True)
    cursor.execute("""
        SELECT recommendation_id
        FROM recommendations
        WHERE condition_id = %s
          AND category_id = %s
          AND recommendation_text = %s
        LIMIT 1
    """, (condition_id, category_id, recommendation_text))
    existing = cursor.fetchone()

    if existing:
        cursor.close()
        flash("That exact recommendation already exists.", "error")
        return redirect(url_for("manage_recommendations"))

    cursor.execute("""
        INSERT INTO recommendations (condition_id, category_id, recommendation_text)
        VALUES (%s, %s, %s)
    """, (condition_id, category_id, recommendation_text))
    db.commit()
    cursor.close()

    flash("Recommendation added.", "success")
    return redirect(url_for("manage_recommendations"))


@app.route("/recommendations/delete", methods=["POST"])
def delete_recommendation():
    recommendation_id = request.form.get("recommendation_id", type=int)

    if not recommendation_id:
        flash("Missing recommendation id.", "error")
        return redirect(url_for("manage_recommendations"))

    cursor = db.cursor()
    cursor.execute("""
        DELETE FROM recommendations
        WHERE recommendation_id = %s
    """, (recommendation_id,))
    deleted = cursor.rowcount
    db.commit()
    cursor.close()

    if deleted:
        flash("Recommendation deleted.", "success")
    else:
        flash("Recommendation not found.", "error")

    return redirect(url_for("manage_recommendations"))


@app.route("/", methods=["GET", "POST"])
def home():
    weather = session.get("latest_weather")
    city_comparison = session.get("latest_city_comparison")

    if request.method == "POST":
        city = (request.form.get("city") or "").strip()
        if not city:
            flash("Enter a city name to search.", "error")
            return redirect(url_for("home"))

        try:
            result = fetch_weather_result(city)
        except ValueError as exc:
            flash(str(exc), "error")
            return redirect(url_for("home"))

        store_latest_search(result)
        weather = result["weather"]
        city_comparison = result["city_comparison"]

    summary, top_cities = get_observation_summary()
    recent_observations = get_recent_observations()

    return render_template(
        "home.html",
        active_page="home",
        theme=(weather or {}).get("theme", "default"),
        weather=weather,
        city_comparison=city_comparison,
        summary=summary,
        top_cities=top_cities,
        recent_observations=recent_observations
    )


@app.route("/recommendations")
def recommendations_page():
    weather = session.get("latest_weather")
    recommendations = session.get("latest_recommendations")

    return render_template(
        "recommendations.html",
        active_page="recommendations",
        theme=(weather or {}).get("theme", "default"),
        weather=weather,
        recommendations=recommendations
    )


@app.route("/recommendations/manage")
def manage_recommendations():
    conditions, categories, all_recommendations = get_recommendation_management_data()

    return render_template(
        "manage_recommendations.html",
        active_page="manage",
        theme="default",
        conditions=conditions,
        categories=categories,
        all_recommendations=all_recommendations
    )


@app.route("/searches")
def searches_page():
    selected_id = request.args.get("observation_id", type=int)
    observations, selected_observation = get_search_history(selected_id)
    summary, top_cities = get_observation_summary()

    return render_template(
        "searches.html",
        active_page="searches",
        theme="wind",
        observations=observations,
        selected_observation=selected_observation,
        summary=summary,
        top_cities=top_cities
    )


if __name__ == "__main__":
    app.run(debug=True)
