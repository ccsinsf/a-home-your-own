
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
    monthyear= db.Column(db.DateTime,nullable=True)
    histprice = db.Column(db.Integer, nullable=True)
    
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