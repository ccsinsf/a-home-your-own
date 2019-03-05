"""Utility file to seed ratings database from MovieLens data in seed_data/"""

from sqlalchemy import func
from model import Price
from model import City
from model import HistoricalData

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


def load_histdata():
    """Load historical data from All Cities Historical data into database"""

    print("histdata")

    for row in open("seed_data/final_all_cities_historical.csv"):
        row = row.rstrip()

        print(row)

        [city_name, state, 
        hist_price_jan_2009, hist_price_feb_2009, hist_price_mar_2009, hist_price_apr_2009,
        hist_price_may_2009, hist_price_jun_2009, hist_price_jul_2009, hist_price_aug_2009, hist_price_sep_2009, hist_price_oct_2009, 
        hist_price_nov_2009, hist_price_dec_2009, hist_price_jan_2010, hist_price_feb_2010, hist_price_mar_2010, hist_price_apr_2010,
        hist_price_may_2010, hist_price_jun_2010, hist_price_jul_2010, hist_price_aug_2010, hist_price_sep_2010, hist_price_oct_2010,
        hist_price_nov_2010, hist_price_dec_2010, hist_price_jan_2011, hist_price_feb_2011, hist_price_mar_2011, hist_price_apr_2011, 
        hist_price_may_2011, hist_price_jun_2011, hist_price_jul_2011, hist_price_aug_2011, hist_price_sep_2011, hist_price_oct_2011,
        hist_price_nov_2011, hist_price_dec_2011, hist_price_jan_2012, hist_price_feb_2012, hist_price_mar_2012, hist_price_apr_2012, 
        hist_price_may_2012, hist_price_jun_2012, hist_price_jul_2012, hist_price_aug_2012, hist_price_sep_2012, hist_price_oct_2012,
        hist_price_nov_2012, hist_price_dec_2012, hist_price_jan_2013, hist_price_feb_2013,hist_price_mar_2013, hist_price_apr_2013, hist_price_may_2013, hist_price_jun_2013, hist_price_jul_2013, hist_price_aug_2013, 
        hist_price_sep_2013, hist_price_oct_2013,
        hist_price_nov_2013, hist_price_dec_2013, hist_price_jan_2014, hist_price_feb_2014, hist_price_mar_2014, hist_price_apr_2014,
        hist_price_may_2014, hist_price_jun_2014, hist_price_jul_2014, hist_price_aug_2014, hist_price_sep_2014, hist_price_oct_2014, 
        hist_price_nov_2014, hist_price_dec_2014, hist_price_jan_2015, hist_price_feb_2015, hist_price_mar_2015, hist_price_apr_2015,
        hist_price_may_2015, hist_price_jun_2015, hist_price_jul_2015, hist_price_aug_2015, hist_price_sep_2015, hist_price_oct_2015, 
        hist_price_nov_2015, hist_price_dec_2015, hist_price_jan_2016, hist_price_feb_2016, hist_price_mar_2016, hist_price_apr_2016,
        hist_price_may_2016, hist_price_jun_2016, hist_price_jul_2016, hist_price_aug_2016, hist_price_sep_2016, hist_price_oct_2016, 
        hist_price_nov_2016, hist_price_dec_2016, hist_price_jan_2017, hist_price_feb_2017, hist_price_mar_2017, hist_price_apr_2017,
        hist_price_may_2017, hist_price_jun_2017, hist_price_jul_2017, hist_price_aug_2017, hist_price_sep_2017, hist_price_oct_2017, 
        hist_price_nov_2017, hist_price_dec_2017, hist_price_jan_2018, hist_price_feb_2018, hist_price_mar_2018, hist_price_apr_2018,
        hist_price_may_2018, hist_price_jun_2018, hist_price_jul_2018, hist_price_aug_2018, hist_price_sep_2018, hist_price_oct_2018, 
        hist_price_nov_2018, hist_price_dec_2018, hist_price_jan_2019] = row.split(",")

        city = City.query.filter((City.city_name == city_name) & (City.state == state)).first()
  
        if city and state:

            histdata = HistoricalData(
                        city_name= city_name,
                        state= state,
                        hist_price_jan_2009= hist_price_jan_2009,
                        hist_price_feb_2009= hist_price_feb_2009,
                        hist_price_mar_2009= hist_price_mar_2009,
                        hist_price_apr_2009= hist_price_apr_2009,
                        hist_price_may_2009= hist_price_may_2009,
                        hist_price_jun_2009= hist_price_jun_2009,
                        hist_price_jul_2009= hist_price_jul_2009,
                        hist_price_aug_2009= hist_price_aug_2009,
                        hist_price_sep_2009= hist_price_sep_2009,
                        hist_price_oct_2009= hist_price_oct_2009,
                        hist_price_nov_2009= hist_price_nov_2009,
                        hist_price_dec_2009= hist_price_dec_2009,

                        hist_price_jan_2010= hist_price_jan_2010,
                        hist_price_feb_2010= hist_price_feb_2010,
                        hist_price_mar_2010= hist_price_mar_2010,
                        hist_price_apr_2010= hist_price_apr_2010,
                        hist_price_may_2010= hist_price_may_2010,
                        hist_price_jun_2010= hist_price_jun_2010,
                        hist_price_jul_2010= hist_price_jul_2010,
                        hist_price_aug_2010= hist_price_aug_2010,
                        hist_price_sep_2010= hist_price_sep_2010,
                        hist_price_oct_2010= hist_price_oct_2010,
                        hist_price_nov_2010= hist_price_nov_2010,
                        hist_price_dec_2010= hist_price_dec_2010,

                        hist_price_jan_2011= hist_price_jan_2011,
                        hist_price_feb_2011= hist_price_feb_2011,
                        hist_price_mar_2011= hist_price_mar_2011,
                        hist_price_apr_2011= hist_price_apr_2011,
                        hist_price_may_2011= hist_price_may_2011,
                        hist_price_jun_2011= hist_price_jun_2011,
                        hist_price_jul_2011= hist_price_jul_2011,
                        hist_price_aug_2011= hist_price_aug_2011,
                        hist_price_sep_2011= hist_price_sep_2011,
                        hist_price_oct_2011= hist_price_oct_2011,
                        hist_price_nov_2011= hist_price_nov_2011,
                        hist_price_dec_2011= hist_price_dec_2011,

                        hist_price_jan_2012= hist_price_jan_2012,
                        hist_price_feb_2012= hist_price_feb_2012,
                        hist_price_mar_2012= hist_price_mar_2012,
                        hist_price_apr_2012= hist_price_apr_2012,
                        hist_price_may_2012= hist_price_may_2012,
                        hist_price_jun_2012= hist_price_jun_2012,
                        hist_price_jul_2012= hist_price_jul_2012,
                        hist_price_aug_2012= hist_price_aug_2012,
                        hist_price_sep_2012= hist_price_sep_2012,
                        hist_price_oct_2012= hist_price_oct_2012,
                        hist_price_nov_2012= hist_price_nov_2012,
                        hist_price_dec_2012= hist_price_dec_2012,

                        hist_price_jan_2013= hist_price_jan_2013,
                        hist_price_feb_2013= hist_price_feb_2013,
                        hist_price_mar_2013= hist_price_mar_2013,
                        hist_price_apr_2013= hist_price_apr_2013,
                        hist_price_may_2013= hist_price_may_2013,
                        hist_price_jun_2013= hist_price_jun_2013,
                        hist_price_jul_2013= hist_price_jul_2013,
                        hist_price_aug_2013= hist_price_aug_2013,
                        hist_price_sep_2013= hist_price_sep_2013,
                        hist_price_oct_2013= hist_price_oct_2013,
                        hist_price_nov_2013= hist_price_nov_2013,
                        hist_price_dec_2013= hist_price_dec_2013,

                        hist_price_jan_2014= hist_price_jan_2014,
                        hist_price_feb_2014= hist_price_feb_2014,
                        hist_price_mar_2014= hist_price_mar_2014,
                        hist_price_apr_2014= hist_price_apr_2014,
                        hist_price_may_2014= hist_price_may_2014,
                        hist_price_jun_2014= hist_price_jun_2014,
                        hist_price_jul_2014= hist_price_jul_2014,
                        hist_price_aug_2014= hist_price_aug_2014,
                        hist_price_sep_2014= hist_price_sep_2014,
                        hist_price_oct_2014= hist_price_oct_2014,
                        hist_price_nov_2014= hist_price_nov_2014,
                        hist_price_dec_2014= hist_price_dec_2014,

                        hist_price_jan_2015= hist_price_jan_2015,
                        hist_price_feb_2015= hist_price_feb_2015,
                        hist_price_mar_2015= hist_price_mar_2015,
                        hist_price_apr_2015= hist_price_apr_2015,
                        hist_price_may_2015= hist_price_may_2015,
                        hist_price_jun_2015= hist_price_jun_2015,
                        hist_price_jul_2015= hist_price_jul_2015,
                        hist_price_aug_2015= hist_price_aug_2015,
                        hist_price_sep_2015= hist_price_sep_2015,
                        hist_price_oct_2015= hist_price_oct_2015,
                        hist_price_nov_2015= hist_price_nov_2015,
                        hist_price_dec_2015= hist_price_dec_2015,

                        hist_price_jan_2016= hist_price_jan_2016,
                        hist_price_feb_2016= hist_price_feb_2016,
                        hist_price_mar_2016= hist_price_mar_2016,
                        hist_price_apr_2016= hist_price_apr_2016,
                        hist_price_may_2016= hist_price_may_2016,
                        hist_price_jun_2016= hist_price_jun_2016,
                        hist_price_jul_2016= hist_price_jul_2016,
                        hist_price_aug_2016= hist_price_aug_2016,
                        hist_price_sep_2016= hist_price_sep_2016,
                        hist_price_oct_2016= hist_price_oct_2016,
                        hist_price_nov_2016= hist_price_nov_2016,
                        hist_price_dec_2016= hist_price_dec_2016,

                        hist_price_jan_2017= hist_price_jan_2017,
                        hist_price_feb_2017= hist_price_feb_2017,
                        hist_price_mar_2017= hist_price_mar_2017,
                        hist_price_apr_2017= hist_price_apr_2017,
                        hist_price_may_2017= hist_price_may_2017,
                        hist_price_jun_2017= hist_price_jun_2017,
                        hist_price_jul_2017= hist_price_jul_2017,
                        hist_price_aug_2017= hist_price_aug_2017,
                        hist_price_sep_2017= hist_price_sep_2017,
                        hist_price_oct_2017= hist_price_oct_2017,
                        hist_price_nov_2017= hist_price_nov_2017,
                        hist_price_dec_2017= hist_price_dec_2017,

                        hist_price_jan_2018= hist_price_jan_2018,
                        hist_price_feb_2018= hist_price_feb_2018,
                        hist_price_mar_2018= hist_price_mar_2018,
                        hist_price_apr_2018= hist_price_apr_2018,
                        hist_price_may_2018= hist_price_may_2018,
                        hist_price_jun_2018= hist_price_jun_2018,
                        hist_price_jul_2018= hist_price_jul_2018,
                        hist_price_aug_2018= hist_price_aug_2018,
                        hist_price_sep_2018= hist_price_sep_2018,
                        hist_price_oct_2018= hist_price_oct_2018,
                        hist_price_nov_2018= hist_price_nov_2018,
                        hist_price_dec_2018= hist_price_dec_2018,

                        hist_price_jan_2019= hist_price_jan_2019)
            
            city.histdata.append(histdata)

            db.session.add_all([histdata, city])

            db.session.commit() 


if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_cities()
    # Load cities first becasue cities table includes a foreign key for the prices table
    load_prices()
    # load historical data last because it includes a foreign key from the cities table 
    load_histdata()
