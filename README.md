# README

This project follows the Odin Project 'Private Events' lesson at https://www.theodinproject.com/lessons/ruby-on-rails-private-events 

Project Instructions:

In these projects, you’ll finally really get to dive into ActiveRecord’s associations, one of the best features it offers.

Warmup: thinking data first
Lay out the data architecture you’d need to implement to build the following scenarios:

A site for pet-sitting (watching someone’s pet while they’re gone). People can babysit for multiple pets and pets can have multiple petsitters.
You like hosting people for dinner so you want to build a dinner party invitation site. A user can create parties, invite people to a party, and accept an invitation to someone else’s party.
Extra credit (tricky): You and your friends just love posting things and following each other. How would you set up the models so a user can follow another user?
Project: Private events
You want to build a site similar to a private Eventbrite which allows users to create events and then manage user signups.

A user can create events. A user can attend many events. An event can be attended by many users. Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”).

This project will require you to model many-to-many relationships and also to be very conscious about your foreign keys and class names (hint: you won’t be able to just rely on Rails’ defaults like you have before).

Your task
We’ve gotten quite far here, so these tasks will only lay out the high level overview of what you’re meant to build. You’ll need to implement the details yourself. As usual, it’s not meant to look pretty, just work. Design is all extra credit.

Setup
Think about and spec out how to set up your data models for this application.
Create a new private-events Rails app and GitHub repo.
Update your README to be descriptive and link to this project.
Events and users
Build and migrate your Event model without any foreign keys or validations. Include the event’s date in your model but don’t worry about doing anything special with it yet.
Create the EventsController and add an #index action that will display all of the events. Create a corresponding view and add a heading with your choice of wording.
Set up devise to handle authentication and create your User model. Set the root_path to be the Event’s Index page.
Add the association between the event creator (a User) and the event. Call this user the “creator”. Add the foreign key to the Event model as necessary. You’ll need to specify your association properties carefully (e.g. :foreign_key, :class_name).
Have the User’s Show page list all the events a user has created.
Update the EventsController and corresponding routes to allow you to create a new event. The #create action should use the #build association reference method to create the new event with the user’s ID prepopulated. Find the right #build association reference method for the type of association you set up between your models. You could use Event’s ::new method and manually enter the ID but… don’t.
Make the form for creating an event.
Have the Event’s Show page display the details of the event.
Event attendance
Add the association between the event attendee (also a User) and the event. Call this user the “attendee”. Call the event the “attended_event”. You’ll again need to juggle specially named foreign keys and classes and sources.
Create and migrate all necessary tables and foreign keys. This will require a “through” table since an Event can have many Attendees and a single User (Attendee) can attend many Events… many-to-many.
Create a Controller and corresponding routes for the “through” table that will allow a user to become an “attendee” of an event. This will also require creating some sort of interface in the view(s) where the user can indicate that they want to attend an event.
Update the Event’s Show page to display a list of attendees.
Add to the User’s Show page a list of their “attended_events”.
Separate this list of “attended_events” into either events that have occurred in the past or events that will occur in the future. You’ll get some good practice building queries and working with dates. Keep this logic in the view and do not put separate method calls in the controller.
Finishing touches
Separate the past and upcoming events on the Event’s Index page by creating two class methods on the Event model (e.g. Event.past).
Refactor the past and upcoming class methods into scopes.
Put navigation links across the top to help you jump around.
Extra Credit: Allow users to edit and delete the events they created.
Extra Credit: Allow users to remove themselves as an attendee to their “attended_events”.
Extra Credit: Make each event private and add the functionality for the event creator to invite specific users to an event.

The project uses Ruby version 3.1.2p20 and Devise gem version 4.9.3

-------------------------------------  

Author notes by Peter Hawes: 

-------------------------------------

I decided to implement all of the extra credit suggestions at the end of the project instructions. 

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
