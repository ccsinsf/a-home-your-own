from jinja2 import StrictUndefined

from flask import (Flask, render_template, redirect, request, flash, session)
from flask_debugtoolbar import DebugToolbarExtension

from model import Price, City, connect_to_db, db


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
def search_results():
    """When the user has entered a number into the search box and "submitted" it,
    process the form in this route"""

    # For a given price, multiply that by 10% and set that as the "max price"
    # Return city_names that are between those amounts 

    budget = int(request.form.get('price'))

    city_results = []

    max_price = budget + int(budget * .1)

    for price in range(budget, max_price):
       city_results = city_results.append(City.city_name)

    print(city_results)   

    #     elif price > 200000 and <= 250000:
    #         city_results.append(City.city_name where median_home_price < 275000)

    #     elif price > 250000 and <= 275000:
    #         city_results.append(City.city_name where median_home_price < 300000)

    #     elif price > 275000 and <= 300000:
    #         city_results.append(City.city_name where median_home_price < 325000)

    #     elif price > 300000 and <= 325000:
    #         city_results.append(City.city_name where median_home_price < 350000)

    #     elif  price > 325000 and <= 350000
    #         city_results.append(City.city_name where median_home_price < 375000)

    #     elif price > 350000 and <= 375000:
    #         city_results.append(City.city_name where median_home_price < 400000)

    #     elif price > 375000 and <= 400000:
    #         city_results.append(City.city_name where median_home_price < 415000) 

    #     elif price > 400000 and <= 415000:
    #         city_results.append(City.city_name where median_home_price < 425000)

    #     elif price > 415000 and <= 430000:
    #         city_results.append(City.city_name where median_home_price < 450000)

    #     elif price > 430000 and <= 450000:
    #         city_results.append(City.city_name where median_home_price < 460000)

    #     elif price > 455000 and <= 475000:
    #         city_results.append(City.city_name where median_home_price < 485000)

    #     elif price > 475000 and <= 500000:
    #         city_results.append(City.city_name where median_home_price < 525000)

    #     elif price > 500000 and <= 650000:
    #         city_results.append(City.city_name where median_home_price < 700000)

    #     elif price > 650000 and <= 800000:
    #         city_results.append(City.city_name where median_home_price < 1000000)

    #     if price > 800000 and <= 1500000:
    #         city_results.append(City.city_name where median_home_price < 2000000)


    # else: 
    #     return "We don't have data for homes in this range yet!"    

    # Problem with this^ : Will need to include a limit on the results to show 
    # homes in this RANGE 

    # will need to index into each number, but since numbers can be 7 digits, will want to
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

    return render_template("/get_price.html")

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
