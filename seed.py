"""Utility file to seed ratings database from MovieLens data in seed_data/"""

from sqlalchemy import func
from model import Price
from model import City

from model import connect_to_db, db
from server import app


def load_prices():
    """Load prices from city_prices_rf into database."""

    print("prices")

    # Read modified_HB_data file and insert data
    for row in open("seed_data/city_prices_rf.csv"):
        # "seed_data/city_prices_z"
        row = row.rstrip()
  
        median_home_price, sales_price_mom, print_date, city, state,  = row.split(",")

        median_home_price = float(median_home_price)
 

        city = City.query.filter((City.city_name == city) & (City.state == state)).first()
  
        if city and state:

            price = Price(
                        median_home_price=median_home_price,
                        sales_price_mom=sales_price_mom,
                        print_date= print_date)
            city.prices.append(price)

            # def __repr__(self):
            #     # Show info about prices (used for testing)
            #     return (f' Median price: {median_home_price}, Sales price MoM: {sales_price_mom}, Print date: {print_date}' )

            # We need to add to the session or it won't ever be stored
            db.session.add_all([price, city])

        # Once we're done, we should commit our work
            db.session.commit()


def load_cities():
    """Load cities from city_locations into database."""
    print("cities")

    for row in open("seed_data/city_locations_encoding1.csv"):
        row = row.rstrip()
        city_id, city_name, state, latitude, longitude = row.split(",")

        city = City(
                    city_name=city_name,
                    state=state,
                    latitude= latitude,
                    longitude=longitude)


        # def __repr__(self):
        #     # Show info about cities 
        #     return (f' City Name: {city_name}, State: {state}')

        # We need to add to the session or it won't ever be stored
        db.session.add(city)

    # Once we're done, we should commit our work
        db.session.commit()

if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_cities()
    # Load cities first becasue cities table includes a foreign key for the prices table
    load_prices()
