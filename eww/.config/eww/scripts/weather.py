#!/usr/bin/env python3
# juminai @ github

import requests
import json
import time
import subprocess

api_key= "69c655f5c49d7a1612da1c5a0617d786"
city_id = '3468615'

def update_eww(var, content):
    subprocess.run([
        "eww", "update", f"{var}={json.dumps(content)}"
    ])

def get_weather(city_id, api_key, units='metric'):
    url = f"http://api.openweathermap.org/data/2.5/weather?APPID={api_key}&id={city_id}&units={units}"
    response = requests.get(url)

    if response.status_code == 200:
        weather_data = response.json()
        return weather_data
    else:
        return None

def get_icon(icon_code):
    icon_map = {
        "01d": "",
        "01n": "",
        "02d": "",
        "02n": "",
        "03d": "",
        "03n": "",
        "04d": "",
        "04n": "",
        "09d": "",
        "09n": "",
        "10d": "",
        "10n": "",
        "11d": "",
        "11n": "",
        "13d": "",
        "13n": "",
        "40d": "",
        "40n": "",
    }

    return icon_map.get(icon_code, "")

def get_icon_color(icon_code):
    color_map = {
        "01d": "#c6a679",
        "01n": "#9ec3c4",
        "02d": "#ceb188",
        "02n": "#8aabac",
        "03d": "#cacaca",
        "03n": "#cacaca",
        "04d": "#cacaca",
        "04n": "#4c4c4c",
        "09d": "#a39ec4",
        "09n": "#a39ec4",
        "10d": "#9ec3c4",
        "10n": "#9ec3c4",
        "11d": "#ceb188",
        "11n": "#ceb188",
        "13d": "#cacaca",
        "13n": "#cacaca",
        "40d": "#9ec3c4",
        "40n": "#9ec3c4",
    }

    return color_map.get(icon_code, "#4c4c4c")

def format_weather_data(weather_data):
    temp = weather_data["main"]["temp"]
    temp_min = weather_data["main"]["temp_min"]
    temp_max = weather_data["main"]["temp_max"]
    feels_like = weather_data["main"]["feels_like"]
    humidity = weather_data["main"]["humidity"]
    description = weather_data["weather"][0]["main"]
    city = weather_data["name"]
    icon_code = weather_data["weather"][0]["icon"]
    icon_color = get_icon_color(icon_code)

    return {
        "temp": temp,
        "temp_min": temp_min,
        "temp_max": temp_max,
        "feels_like": feels_like,
        "humidity": humidity,
        "description": description,
        "city": city,
        "icon": get_icon(icon_code),
        "icon_color": icon_color,
    }

if __name__ == "__main__":
    while True:
        weather_data = get_weather(city_id, api_key)
        
        if weather_data:
            weather = format_weather_data(weather_data)
            update_eww("weather", weather)
        time.sleep(1800)
