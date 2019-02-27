from jinja2 import StrictUndefined

from flask import (Flask, render_template, redirect, request, flash, session)
from flask_debugtoolbar import DebugToolbarExtension

from model import Price, City, connect_to_db, db
from refactoring_queries import *

import json 

app = Flask(__name__)

# Required to use Flask sessions and the debug toolbar
app.secret_key = "ABC"

# Normally, if you use an undefined variable in Jinja2, it fails
# silently. This is horrible. Fix this so that, instead, it raises an
# error.
app.jinja_env.undefined = StrictUndefined


@app.route('/')
def index():
    """Homepage incudes the search form."""
    return render_template("homepage.html")

@app.route('/get-price', methods=['GET', 'POST'])
def find_budget():
    # """When the user has entered a number into the search box and "submitted" it,
    # process the form in this route"""

    # For a given price, multiply that by 10% and set that as the "max price"
    # Return city_names that are between those amounts 

    budget = int(request.form.get('price'))
    # Extract the user's budget ("price") from the form they submitted

    # -> error handling: if price negative, send error, alert message 

    max_price = find_max_budget(budget)
    # Max budget (upper limit) is 10% more than the user's input

    debug_functions(budget)
    # Show the user's budget in the console to make sure this part is running propperly

    create_city_results_list()
    # Instanciate an empty list to house the city results data

    city_results = find_cities_in_budget(max_price)
    # Find the city by median home price (modeling off Skills Assessment 5)
    # Return the top 20 closest matches to foster UX. These results will also be
    # returned to the console 

    cityLocations= []
    print("**debug**")
    for city in city_results:
        longitude = city.longitude
        latitude = city.latitude
        city_name = city.city_name
        state = city.state
        city_id = city.city_id


        cityLocations.append({
            "longitude" : longitude,
            "latitude": latitude,
            "city_name": city_name,
            "state": state, 
            "city_id": city_id 
            })


    print(cityLocations)
    # print(cityLocations)
    # This is working ^ 

    print("Debugging 3: This is right before def get_mapbox_json")

    pp_city_objects(city_results)
    # Render on the HTML page and console city_name, state, 
    # city.prices[0].median_home_price.
    print("**debug4")
    return render_template("/get_price.html", city_results= city_results, cityLocations= json.dumps(cityLocations))

    

# Will need to think more about this route and how it should function 
@app.route("/citydetails/<city_id>")
def show_city_details(city_id):
    """Show details about a given city."""

# sql alchemy query for returning a specific city's information 

# similar to {city.prices[0].median_home_price}
    
    city_objects = City.query.filter_by(city_id=city_id).all()

    print(city_objects)
    # This works 

    # city_details = []
    
    # city_details.append( {
    # "city_name" : city_objects.city_name,
    # "state": city_objects.state,
    # "median_home_price":  city_objects.prices[0].median_home_price,
    # "sales_price_mom": city_objects.prices[0].sales_price_mom
    # })

    # city_details = city_details.__dict__


    # print(city_details)
    # filter(city_id = city_id)
    
    print ("debug5")
    return render_template("/citydetails.html", city_objects= city_objects)



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
