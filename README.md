Hair Salon is a website where hair salon owners can view a list of stylists and their clients, 8/21/2015

By Lisa Folliard


Description

This application gives salon owners the ability to add, update and delete stylist information, as well as view clients associated with each stylist. There are two classes (Stylist and Client) and two psql tables (stylists and clients) used.


Setup

$ git clone https://github.com/lisafolliard/database_basics_Code_Review.git

$ cd hair_salon to enter project directory

$ bundle to install program dependencies

$ postgres to start a postgres server

Open new terminal tab and run $ psql

in PSQL user=# CREATE DATABASE hair_salon;

in PSQL user=# \c hair_salon

in PSQL user=# CREATE TABLE stylists (id serial PRIMARY KEY, firstname varchar, lastname varchar);

in PSQL user=# CREATE TABLE clients (id serial PRIMARY KEY, firstname varchar, lastname varchar, stylist_id int);

open new tab and run $ ruby app.rb in the project directory to run sinatra app

go to localhost:4567 in your browser to open webapp


Technologies Used

Written in Ruby

Ran test site with Sinatra

Error checking with RSpec and Capybara

Database management with postgresql


Legal

Copyright (c) 2015 Lisa Folliard

This software is licensed under the MIT license.
