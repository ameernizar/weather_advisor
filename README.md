# Weather Advisor App

A simple Python + MySQL web app that fetches weather data and gives recommendations based on temperature, humidity, and rainfall.

---

## Features

* Fetches real-time weather for a user-specified city.
* Suggests healthcare, skincare tips, and umbrella usage based on current weather.

---

## Technologies Used

* **Backend:** Python
* **Frontend:** HTML + CSS
* **Database:** MySQL
* **API:** OpenWeatherMap
* **Dependencies:**

  * `python-dotenv` → load API keys from `.env`
  * `mysql-connector-python` → connect to MySQL
  * `requests` → fetch API data

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone git@github.com:ameernizar/weather_advisor.git
cd weather_advisor
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

### 3. Setup Environment Variables

Create a `.env` file in the project root:

```text
API_KEY=your_weather_api_key
DB_USER=your_db_username
DB_PASS=your_db_password
```

> **Important:** Keep `.env` in `.gitignore` to avoid committing sensitive information.

### 4. Setup MySQL Database

1. Log in to MySQL:

```bash
mysql -u root -p
```

2. Create the database:

```sql
CREATE DATABASE weather_db;
```

3. Run the schema file:

```sql
USE weather_db;
SOURCE schema.sql;
```

### 5. Run the App

```bash
python app.py
```

* Open `index.html` in your browser to interact with the frontend.

---

### Notes

* The app runs on **localhost**.
* Ensure the database username/password matches your `.env` file.
* Never commit the `.env` file with real credentials.

---

### Optional Enhancements

* Add user authentication to store personalized city preferences.
* Store more detailed weather data for analytics.
* Improve frontend using a web framework like Flask or React.


