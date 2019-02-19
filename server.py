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
        # .group_by(City.city_id)
        .filter(Price.median_home_price <= max_price)
        .order_by(Price.median_home_price.desc())
        # Want to order by price in descending order so users see relevant data
        .limit(20))

    print(city_results)

    for city in city_results:
        print(f"{city.city_name}, {city.state} : Median home price is ${city.prices[0].median_home_price}")

    return render_template("/get_price.html", city_results= city_results)


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
