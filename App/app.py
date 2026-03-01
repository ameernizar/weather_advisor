from urllib import response

from flask import Flask, render_template, request
import requests
import mysql.connector
import os
from dotenv import load_dotenv

app = Flask(__name__)

load_dotenv()
DB_USER = os.getenv("DB_USER")  
DB_PASS = os.getenv("DB_PASS")    

db = mysql.connector.connect(
    host="localhost",
    user=DB_USER,
    password=DB_PASS,
    database="weather_app"
)

load_dotenv()
API_KEY = os.getenv("API_KEY")

@app.route("/", methods=["GET", "POST"])
def home():
    data = None
    city = None
    temp = None
    rain = None
    condition = None

    if request.method == "POST":
        city = request.form["city"]

        # 1. API call
        url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}&units=metric"
        response = requests.get(url).json()
        if "main" in response:
            temp = response["main"]["temp"]
            rain = response.get("rain", {}).get("1h", 0)
            condition = response.get("weather", [{}])[0].get("main", "Clear")
        else:
            return "Invalid city or API error. Please try again."
        cursor = db.cursor()

        # 2. Find condition
        cursor.execute("""
            SELECT condition_id FROM weather_conditions
            WHERE %s BETWEEN min_temp AND max_temp
            AND %s BETWEEN min_rain AND max_rain
            AND is_extreme = 0
            LIMIT 1
        """, (temp, rain))

        result = cursor.fetchone()

        if result:
            condition_id = result[0]
        else:
            cursor.execute("SELECT condition_id FROM weather_conditions WHERE is_extreme = 1")
            condition_id = cursor.fetchone()[0]

        # 3. Get recommendations
        cursor.execute("""
            SELECT c.category_name, r.recommendation_text
            FROM recommendations r
            JOIN recommendation_categories c
            ON r.category_id = c.category_id
            WHERE r.condition_id = %s
        """, (condition_id,))

        results = cursor.fetchall()

        # 4. Group data
        grouped = {}
        for category, text in results:
            if category not in grouped:
                grouped[category] = []
            grouped[category].append(text)

        data = grouped

    return render_template(
        "index.html",
        data=data, 
        city=city,
        temp=temp,
        rain=rain,
        condition=condition
    )
if __name__=="__main__":
    app.run(debug=True)