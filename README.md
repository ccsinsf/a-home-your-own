A Home Your Own
=====================
___
What is it?
---
A Home Your Own is a full-stack web application designed to help users identify cities in which a given dollar amount is the median home price. Users can view the city locations on a map and learn more about individual cities. City information pages will include the median home price, links to helpful resources and graphs of 10 years of historical home prices.




Usage
---
Use the data provided in `seed_data` to populate the tables in the database.

Run the app:

- Run and shell into Vagrant
- `cd ~/vagrant`
- `vagrant up` 
- `vagrant ssh`	  

- `cd ~/src/hackbright_project`
- `virtualenv env` 
- `source env/bin/activate`
- `pip3 install -r requirements.txt`
- `python3 server.py`
- Now you can visit `http://localhost:5000`


About the data
---
All home price data was collected from Redfin via Tableau or Zillow. Do not overwrite or edit these files.

Technologies
---
- Python 3 
- Flask
- SQLAlchemy
- Javascript
- HTML
- CSS
- Bootstrap
- Mapbox API

Contact:
---
You can contact me at ccsinsf@gmail.com
