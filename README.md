# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
* 

Participant
- participant should be valid
- name should be present
- description should be present
- participant_id should be present **
- maximum length for name and description, maybe a minimum for description

Builder
- buildername should be present
- email should be present
- size restriction on email and buildername
- email address should be valid format
- email should be unique, case insensitve


Prefix      Verb    URI Pattern           Controller#Action
wagons      GET     /wagons               wagons#index
new_wagon   GET     /wagons/new           wagons#new          #displays a new form
            POST    /wagons               wagons#create       #submit the information from the form
edit_wagon  GET     /wagons/:id/edit      wagons#edit         #display an edit form
            PATCH   /wagons/:id           wagons#update       #submit the edited form information
wagons      GET     /wagons/:id           wagons#show         #display a particular wagon
            DELETE  /wagons/:id           wagons#destroy      #deletes a particular wagon
            
password_digest

password

password_confirmation

authenticate

SESSION!

- sessions_controller.rb
- login routes - login, logout
- test to get the route
- Not a model backed resource!
- Storing the encrypted corsogroup_id in the session hash