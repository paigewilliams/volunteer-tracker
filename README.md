# Volunteer Tracker

#### December 7th, 2018

## Contributors

#### By **Paige Williams**

![alt text](https://github.com/paigewilliams/volunteer-tracker/blob/master/img/Screen%20Shot%202018-12-07%20at%204.18.46%20PM.png)

## Description

This is an exercise in using custom Postgres databases and implementing raw SQL into Ruby. The goal of this project is to create a website to track volunteers working on a project. Each project can have many volunteers, but each volunteer can only work on one project at a time. Volunteers and projects, can be added, updated and deleted.


## Specs  

View specs [here](https://github.com/paigewilliams/volunteer-tracker/tree/master/spec).

## Objectives

- [x] Tests are 100% passing. You may not significantly alter the included tests but you may add additional tests as necessary.
- [x] Database is set up correctly.
- [x] Correct set up of a one-to-many relationship
- [x] Sinatra has required CRUD functionality.
- [x] Project has strong commit history history.
- [x] Project has detailed README with all necessary setup instructions and a description of the project.
- [x] Required functionality was in place by the Friday deadline.
- [x] Student can demonstrate understanding of Ruby concepts if asked.

## Setup and Installation

1. Clone the project from https://github.com/paigewilliams/volunteer-tracker.git to a local directory.

2. Go to the project directory in the terminal and create the database with:
```console
createdb volunteer_tracker < my_database.sql
```
3. Go to the project directory in the terminal and run the Sinatra server with:
```console
ruby app.rb
```
4. Create test database in the terminal with:
```console
createdb -T volunteer_tracker volunteer_tracker_test
```
5. Run the tests with:
```console
rspec
```
5. Go to the address localhost:4567 in your preferred web browser to run the app.

## Support and Contact Details

If you have any issues or questions, please email me at paw145@humboldt.edu

## Technologies used
1. **Ruby 2.5.1**
2. **Sinatra**
3. **Postgres**
4. **SQL**

## Known Bugs
No known bugs.

## Legal

Copyright (c) 2018 Paige Williams

Licensed under the MIT License
