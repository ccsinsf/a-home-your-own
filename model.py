
"""Models and database functions for Ratings project."""

from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

# This is the connection to the PostgreSQL database; we're getting this through
# the Flask-SQLAlchemy helper library. On this, we can find the `session`
# object, where we do most of our interactions (like committing, etc.)

db = SQLAlchemy()


class Price(db.Model):
    """Median price of a home in a given city."""

    __tablename__ = "prices"

    price_id= db.Column(db.Integer, autoincrement=True, primary_key=True)
    city_id = db.Column(db.Integer, db.ForeignKey('cities.city_id'), nullable=True)
    median_home_price = db.Column(db.Integer, nullable=True)
    sales_price_mom = db.Column(db.String(20), nullable=True)
    print_date= db.Column(db.String(10), nullable=True)

    cities = db.relationship("City")

class City(db.Model):
    """Cities and their locations"""

    __tablename__ = "cities"

    city_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    city_name= db.Column(db.String(25))
    state = db.Column(db.String(25))
    latitude = db.Column(db.Float(11), nullable = True)
    longitude = db.Column(db.Float(11), nullable = True)
    
    prices = db.relationship("Price")
    histdata = db.relationship("HistoricalData")


class HistoricalData(db.Model):

    __tablename__ = "histdata"

    hist_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    city_id = db.Column(db.Integer, db.ForeignKey('cities.city_id'), nullable=True)
    city_name= db.Column(db.String(25), nullable=True)
    state = db.Column(db.String(25), nullable=True)
    

    hist_price_jan_2009= db.Column(db.Integer, nullable=True)
    hist_price_feb_2009= db.Column(db.Integer, nullable=True)
    hist_price_mar_2009= db.Column(db.Integer, nullable=True)
    hist_price_apr_2009= db.Column(db.Integer, nullable=True)
    hist_price_may_2009= db.Column(db.Integer, nullable=True)
    hist_price_jun_2009= db.Column(db.Integer, nullable=True)
    hist_price_jul_2009= db.Column(db.Integer, nullable=True)
    hist_price_aug_2009= db.Column(db.Integer, nullable=True)
    hist_price_sep_2009= db.Column(db.Integer, nullable=True)
    hist_price_oct_2009= db.Column(db.Integer, nullable=True)
    hist_price_nov_2009= db.Column(db.Integer, nullable=True)
    hist_price_dec_2009= db.Column(db.Integer, nullable=True)

    hist_price_jan_2010= db.Column(db.Integer, nullable=True)
    hist_price_feb_2010= db.Column(db.Integer, nullable=True)
    hist_price_mar_2010= db.Column(db.Integer, nullable=True)
    hist_price_apr_2010= db.Column(db.Integer, nullable=True)
    hist_price_may_2010= db.Column(db.Integer, nullable=True)
    hist_price_jun_2010= db.Column(db.Integer, nullable=True)
    hist_price_jul_2010= db.Column(db.Integer, nullable=True)
    hist_price_aug_2010= db.Column(db.Integer, nullable=True)
    hist_price_sep_2010= db.Column(db.Integer, nullable=True)
    hist_price_oct_2010= db.Column(db.Integer, nullable=True)
    hist_price_nov_2010= db.Column(db.Integer, nullable=True)
    hist_price_dec_2010= db.Column(db.Integer, nullable=True)

    hist_price_jan_2011= db.Column(db.Integer, nullable=True)
    hist_price_feb_2011= db.Column(db.Integer, nullable=True)
    hist_price_mar_2011= db.Column(db.Integer, nullable=True)
    hist_price_apr_2011= db.Column(db.Integer, nullable=True)
    hist_price_may_2011= db.Column(db.Integer, nullable=True)
    hist_price_jun_2011= db.Column(db.Integer, nullable=True)
    hist_price_jul_2011= db.Column(db.Integer, nullable=True)
    hist_price_aug_2011= db.Column(db.Integer, nullable=True)
    hist_price_sep_2011= db.Column(db.Integer, nullable=True)
    hist_price_oct_2011= db.Column(db.Integer, nullable=True)
    hist_price_nov_2011= db.Column(db.Integer, nullable=True)
    hist_price_dec_2011= db.Column(db.Integer, nullable=True)

    hist_price_jan_2012= db.Column(db.Integer, nullable=True)
    hist_price_feb_2012= db.Column(db.Integer, nullable=True)
    hist_price_mar_2012= db.Column(db.Integer, nullable=True)
    hist_price_apr_2012= db.Column(db.Integer, nullable=True)
    hist_price_may_2012= db.Column(db.Integer, nullable=True)
    hist_price_jun_2012= db.Column(db.Integer, nullable=True)
    hist_price_jul_2012= db.Column(db.Integer, nullable=True)
    hist_price_aug_2012= db.Column(db.Integer, nullable=True)
    hist_price_sep_2012= db.Column(db.Integer, nullable=True)
    hist_price_oct_2012= db.Column(db.Integer, nullable=True)
    hist_price_nov_2012= db.Column(db.Integer, nullable=True)
    hist_price_dec_2012= db.Column(db.Integer, nullable=True)

    hist_price_jan_2013= db.Column(db.Integer, nullable=True)
    hist_price_feb_2013= db.Column(db.Integer, nullable=True)
    hist_price_mar_2013= db.Column(db.Integer, nullable=True)
    hist_price_apr_2013= db.Column(db.Integer, nullable=True)
    hist_price_may_2013= db.Column(db.Integer, nullable=True)
    hist_price_jun_2013= db.Column(db.Integer, nullable=True)
    hist_price_jul_2013= db.Column(db.Integer, nullable=True)
    hist_price_aug_2013= db.Column(db.Integer, nullable=True)
    hist_price_sep_2013= db.Column(db.Integer, nullable=True)
    hist_price_oct_2013= db.Column(db.Integer, nullable=True)
    hist_price_nov_2013= db.Column(db.Integer, nullable=True)
    hist_price_dec_2013= db.Column(db.Integer, nullable=True)

    hist_price_jan_2014= db.Column(db.Integer, nullable=True)
    hist_price_feb_2014= db.Column(db.Integer, nullable=True)
    hist_price_mar_2014= db.Column(db.Integer, nullable=True)
    hist_price_apr_2014= db.Column(db.Integer, nullable=True)
    hist_price_may_2014= db.Column(db.Integer, nullable=True)
    hist_price_jun_2014= db.Column(db.Integer, nullable=True)
    hist_price_jul_2014= db.Column(db.Integer, nullable=True)
    hist_price_aug_2014= db.Column(db.Integer, nullable=True)
    hist_price_sep_2014= db.Column(db.Integer, nullable=True)
    hist_price_oct_2014= db.Column(db.Integer, nullable=True)
    hist_price_nov_2014= db.Column(db.Integer, nullable=True)
    hist_price_dec_2014= db.Column(db.Integer, nullable=True)

    hist_price_jan_2015= db.Column(db.Integer, nullable=True)
    hist_price_feb_2015= db.Column(db.Integer, nullable=True)
    hist_price_mar_2015= db.Column(db.Integer, nullable=True)
    hist_price_apr_2015= db.Column(db.Integer, nullable=True)
    hist_price_may_2015= db.Column(db.Integer, nullable=True)
    hist_price_jun_2015= db.Column(db.Integer, nullable=True)
    hist_price_jul_2015= db.Column(db.Integer, nullable=True)
    hist_price_aug_2015= db.Column(db.Integer, nullable=True)
    hist_price_sep_2015= db.Column(db.Integer, nullable=True)
    hist_price_oct_2015= db.Column(db.Integer, nullable=True)
    hist_price_nov_2015= db.Column(db.Integer, nullable=True)
    hist_price_dec_2015= db.Column(db.Integer, nullable=True)

    hist_price_jan_2016= db.Column(db.Integer, nullable=True)
    hist_price_feb_2016= db.Column(db.Integer, nullable=True)
    hist_price_mar_2016= db.Column(db.Integer, nullable=True)
    hist_price_apr_2016= db.Column(db.Integer, nullable=True)
    hist_price_may_2016= db.Column(db.Integer, nullable=True)
    hist_price_jun_2016= db.Column(db.Integer, nullable=True)
    hist_price_jul_2016= db.Column(db.Integer, nullable=True)
    hist_price_aug_2016= db.Column(db.Integer, nullable=True)
    hist_price_sep_2016= db.Column(db.Integer, nullable=True)
    hist_price_oct_2016= db.Column(db.Integer, nullable=True)
    hist_price_nov_2016= db.Column(db.Integer, nullable=True)
    hist_price_dec_2016= db.Column(db.Integer, nullable=True)

    hist_price_jan_2017= db.Column(db.Integer, nullable=True)
    hist_price_feb_2017= db.Column(db.Integer, nullable=True)
    hist_price_mar_2017= db.Column(db.Integer, nullable=True)
    hist_price_apr_2017= db.Column(db.Integer, nullable=True)
    hist_price_may_2017= db.Column(db.Integer, nullable=True)
    hist_price_jun_2017= db.Column(db.Integer, nullable=True)
    hist_price_jul_2017= db.Column(db.Integer, nullable=True)
    hist_price_aug_2017= db.Column(db.Integer, nullable=True)
    hist_price_sep_2017= db.Column(db.Integer, nullable=True)
    hist_price_oct_2017= db.Column(db.Integer, nullable=True)
    hist_price_nov_2017= db.Column(db.Integer, nullable=True)
    hist_price_dec_2017= db.Column(db.Integer, nullable=True)

    hist_price_jan_2018= db.Column(db.Integer, nullable=True)
    hist_price_feb_2018= db.Column(db.Integer, nullable=True)
    hist_price_mar_2018= db.Column(db.Integer, nullable=True)
    hist_price_apr_2018= db.Column(db.Integer, nullable=True)
    hist_price_may_2018= db.Column(db.Integer, nullable=True)
    hist_price_jun_2018= db.Column(db.Integer, nullable=True)
    hist_price_jul_2018= db.Column(db.Integer, nullable=True)
    hist_price_aug_2018= db.Column(db.Integer, nullable=True)
    hist_price_sep_2018= db.Column(db.Integer, nullable=True)
    hist_price_oct_2018= db.Column(db.Integer, nullable=True)
    hist_price_nov_2018= db.Column(db.Integer, nullable=True)
    hist_price_dec_2018= db.Column(db.Integer, nullable=True)

    hist_price_jan_2019= db.Column(db.Integer, nullable=True)

    cities = db.relationship("City")


# Helper functions

def connect_to_db(app):
    """Connect the database to our Flask app."""

    # Configure to use our PstgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///home_db'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print("Connected to DB.")