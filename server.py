from flask import Flask, redirect, request, render_template, session
from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined

app = Flask(__name__)
app.jinja_env.undefined = StrictUndefined
app.jinja_env.auto_reload = True
app.config.update(DEBUG_TB_INTERCEPT_REDIRECTS = False)
# used this website to learn more about Flask config http://flask.pocoo.org/docs/1.0/config/


@app.route("/")
def show_homepage_and_form():
    """Show the user our landing page and show user form"""
    
    return render_template("homepage.html")



    
# ------- #

if __name__ == "__main__":
# We have to set debug=True here, since it has to be True at the
# point that we invoke the DebugToolbarExtension
app.debug = True

# Use the DebugToolbar
DebugToolbarExtension(app)

app.run(host="0.0.0.0")
