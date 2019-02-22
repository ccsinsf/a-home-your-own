from jinja2 import StrictUndefined

from flask import (Flask, render_template, redirect, request, flash, jsonify, session)
from flask_debugtoolbar import DebugToolbarExtension

from model import Price, City, connect_to_db, db
from refactoring_queries import *

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
        city_id = city.city_id

        cityLocations.append((longitude, latitude, city_id, city_name))

    print("debug 2")
    print(cityLocations)
    # This is working ^ 


    pp_city_objects(city_results)
    # Render on the HTML page and console city_name, state, 
    # city.prices[0].median_home_price.
    print("**debug3")
    return render_template("/get_price.html", city_results= city_results, cityLocations= jsonify(cityLocations))


# @app.route('/results_map.json')
# def results_map():
#     """JSON infomration about the search results map"""

#     city_locations = { 
#                 "city_id" :("longitude": longitude, "latitude": latitude)}

#     # Call the previous function so that you have those specific cities^


#         # append to dictionary over each iteration

#     print("***ONE****")
   
#     print("****TwO***")
#     print(JSON.dumps(city_locations))

#     print("****THREE***")
#     return render_template("/get_price.html", cityLocations = JSON.dumps(city_locations))



    # Need to pass in city_results so that the right pins show up 

    # for city in city_results.limit(20):
    #     return json.dumps(cityLocation)    




# Will need to think more about this route and how it should function 
@app.route("/citydetails")
def show_city_details():
    """Show details about a given city."""

    city_details = (db.session
        .query(City)
        .join(Price)
        # .group_by(City.city_id)
        .filter(Price.median_home_price <= max_price)
        .order_by(Price.median_home_price.desc())
        # Want to order by price in descending order so users see relevant data
        .limit(20))
#     users = User.query.all()
#     return render_template("user_list.html", users=users)


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
