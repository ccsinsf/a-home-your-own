"""Utility file to seed ratings database from MovieLens data in seed_data/"""

from sqlalchemy import func
from model import Price
from model import City
# from model import Movie

from model import connect_to_db, db
from server import app


def load_prices():
    """Load prices from city_prices_rf city_prices_z into database."""

    print("prices")

    # Delete all rows in table, so if we need to run this a second time,
    # we won't be trying to add duplicate users
    # price.query.delete()

    # Read modified_HB_data file and insert data
    for row in open("seed_data/city_prices_rf.csv"):
        # "seed_data/city_prices_z"
        row = row.rstrip()
        price_id, median_home_price, sales_price_mom, print_date, unused, state, city = row.split(",")

        prices = Price(price_id=price_id,
                    median_home_price=median_home_price,
                    sales_price_mom=sales_price_mom,
                    print_date= print_date)

        # We need to add to the session or it won't ever be stored
        db.session.add(prices)

    # Once we're done, we should commit our work
    db.session.commit()


def load_cities():
    """Load cities from city_locations into database."""
    print("cities")

    for row in open("seed_data/city_locations.csv"):
        row = row.rstrip()
        city_id, city_name, state, latitude, longitude = row.split(",")

        cities = City(city_id=city_id,
                    city_name=city_name,
                    state=state,
                    latitude= latitude,
                    longitude=longitude)

        # We need to add to the session or it won't ever be stored
        db.session.add(cities)

    # Once we're done, we should commit our work
    db.session.commit()

if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_prices()
    load_cities()
    # load_ratings()
    # set_val_user_id()
