# _{Hair Salon}_

##### _{A website where hair salon owners can view a list of stylists and their clients}, {8/21/2015}_

#### By _**{Lisa Folliard}**_

## Description

_{This application gives salon owners the ability to add, view, update and delete stylist and clients, as well as view clients associated with each stylist.}_

## Setup

* _$ clone repository to local system

* _$ cd hair_salon to enter project directory_

* _$ bundle to install program dependencies_

* _$ postgres to start a postgres server_

* _Open new terminal tab and run $ psql_

* _in PSQL user=# CREATE DATABASE hair_salon;_

* _in PSQL user=# \c hair_salon_

* _in PSQL user=# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);_

* _in PSQL user=# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);_

* _in PSQL user=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;_

* _open new tab and run $ ruby app.rb in project directory to run sinatra app_

* _go to localhost:4567 in browser to open webapp_

## Technologies Used

_{Written in Ruby

Ran test site with Sinatra

Error checking with RSpec and Capybara

Database management with postgresql}_

### Legal

Copyright (c) 2015 **_{Lisa Folliard}_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
