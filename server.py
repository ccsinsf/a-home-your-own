from jinja2 import StrictUndefined

from flask import (Flask, render_template, redirect, request, flash, session)
from flask_debugtoolbar import DebugToolbarExtension

from model import Price, City, connect_to_db, db
# from utility_functions import find_budget


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
    """When the user has entered a number into the search box and "submitted" it,
    process the form in this route"""

    # For a given price, multiply that by 10% and set that as the "max price"
    # Return city_names that are between those amounts 

    budget = int(request.form.get('price'))

    print("Im debugging yayayayaya")
    print(budget)

    city_results = []

    max_price = budget + int(budget * .1)

# def find_cities_in_budget():
# Find city by median house price (modeling off Skills5)

    city_results = (db.session
        .query(City)
        .join(Price)
        .group_by(City.city_id)
        .filter(Price.median_home_price <= max_price)
        .all())

    print(city_results)

    for city in city_results:
        print(f"{city.city_name}, {city.state} : Median home price is ${city.prices[0].median_home_price}")

    # price_results = (db.session
    #     .query(Price.median_home_price)
    #     .join(City)
    #     .group_by(Price.city_id)
    #     .filter(City.city_name in city_results)
    #     .all())

    # print(price_results)

    # for mhp in range(budget, max_price):
    # #     #  find each median_home_price between budget and max budget and return
    # #     #  and add that city_name (found on the cities table, in the City class,)
    # #     #  to the list, city_results 

    #     city_results = city_results.append(City.city_name)
    

    # Option: can index into each number, but since numbers can be 7 digits, will want to
    # remove the back 3 digits

    # price = price[:-3]

    # This will return all but the last 3 digits 

    # dollar = request.args.get[price]

    # price = int(price)
    # # Get the dollar amount that was entered in the input box called 'price' on homepage.html

    # # price.strip('$','.',',', '-')
    # # # Strip any non alphanumberical symbols, incase a user enters the $, ',', or decimal 

    # # search_price = int(price)
    # # # Convert the number to an integer 

    # # # List slice the last 3 index positions 
    # # narrow_search = search_price[:-3]

    # print(price)
    # print(price)

    return render_template("/get_price.html", city_results= city_results)

# @app.route('/get-price', methods=['POST'])
# def search():
#     """When the user has entered a number into the search box and "submitted" it,
#     process the form in this route"""
    
#     price = request.form.get['price']
#     price = int(price)
#     # Get the dollar amount that was entered in the input box called 'price' on homepage.html

#     # price.strip('$','.',',', '-')
#     # # Strip any non alphanumberical symbols, incase a user enters the $, ',', or decimal 

#     # search_price = int(price)
#     # # Convert the number to an integer 

#     # # List slice the last 3 index positions 
#     # narrow_search = search_price[:-3]

#     print(price)
#     print(price)

#     return redirect("/get-price")

    # need to index the search_price 


# @app.route("/users")
# def user_list():
#     """Show list of users."""

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
