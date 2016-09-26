[![Build Status](https://travis-ci.org/srMarquinho/members-demo.svg?branch=master)](https://travis-ci.org/srMarquinho/members-demo) [![Coverage Status](https://coveralls.io/repos/github/srMarquinho/members-demo/badge.svg?branch=master)](https://coveralls.io/github/srMarquinho/members-demo?branch=master)

# Members Demo

The database stores information about its members. Each member can be associated with 1 or more school.

This demo allows someone to add a new member with the fields “Name”, “Email Address” and "School" (selected from a list). The demo displays all members for a selected school.

Extra features:
- User can add, view, edit and delete schools, as well as members and its associated schools (following CRUD principles).
- User can view a member from a selected school.
- Name (unique and present) and email validations.
- Flash error messages.

Why Rails? It is easy to expand features and *fast to build*. Although, I'm willing to work in different languages.

The database has a many-to-many relationship between schools and members with one joined table. I've used PostgreSQL for easy Heroku implementation.

I've considered separating concerns and avoiding dependencies, clean code and Test Driven Development.

## Configuration:

Visit <https://members-demo.herokuapp.com> to see the result.

Alternatively, if you want to run in your own machine:
(assuming you have ruby, rails and postgresql installed)

- Clone this repository `git clone https://github.com/srMarquinho/members-demo.git`
- Navigate to the repo directory `cd members-demo`
- Install dependencies `bundle install`
- Run the database setup `rake db:create` and `rake db:migrate`
- Run the server `rails s`
- Visit <http://localhost:3000/>

#### See Tests:
- Run `rspec`
