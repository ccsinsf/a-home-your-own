# The purpose of this doc is to test keep server.py clean and organized by 
# placing all functions here and calling them in server.py
from jinja2 import StrictUndefined

from flask import (Flask, render_template, redirect, request, flash, session)
from flask_debugtoolbar import DebugToolbarExtension

from model import Price, City, connect_to_db, db
from model import *

# init_app()

def find_budget():
    """When the user has entered a number into the search box and "submitted" it,
    process the form in this route"""

    # For a given price, multiply that by 10% and set that as the "max price"
    # Return city_names that are between those amounts 
 
    budget = int(request.form.get('price'))
    print(budget)

    # error handling: if price negative, send error, alert message 

def find_max_budget(budget):
    max_price = budget + int(budget * .1)
    return(max_price)

def debug_functions(budget):
    print("Im debugging yayayayaya")
    print(budget)

def create_city_results_list():
    # Instanciate an empty list where city results will go 
    city_results = []    

def find_cities_in_budget(max_price):
# Find city by median house price (modeling off Skills5)

    city_results = (db.session
        .query(City)
        .join(Price)
        # .group_by(City.city_id)
        .filter(Price.median_home_price <= max_price)
        .order_by(Price.median_home_price.desc())
        # Want to order by price in descending order so users see relevant data
        .limit(20))


    return(city_results)

def get_city_objects(city_results):

    for city in city_results:
        print(f"{city.city_name}, {city.state} : Median home price is ${city.prices[0].median_home_price}")

    # return render_template("/get_price.html", city_results= city_results)


if __name__ == "__main__":
    # We have to set debug=True here, since it has to be True at the
    # point that we invoke the DebugToolbarExtension
    app.debug = True
    # make sure templates, etc. are not cached in debug mode
    app.jinja_env.auto_reload = app.debug

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run(port=5000, host='0.0.0.0')








