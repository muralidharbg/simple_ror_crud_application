# README

* Ruby version: ruby 2.3.1

* System dependencies: mysql

* Database creation: 
create `terminal_project_development` and `terminal_project_test` schema in mysql. Change the username and password credentials in config/database.yml
Running the project in development mode would require the mysql user to have privileges to create, drop tables 

* Database initialization: run `rake db:migrate` in the terminal in the root location of the project after the databases are created

* How to run the test suite
Some sample data is written in test/fixtures which needs to be loaded to the `terminal_project_test` (This is taken care of by the below command) 

	rake db:test:load
	<!-- unit testing the models -->
	rails test test/models/terminal_test.rb
	<!-- unit testing the controllers -->
	rails test test/controllers/terminals_controller_test.rb 
	

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions: `rails server` launches a web server in your local machine. The command execution will tell you the hostname and the port number to access. Ex: http://localhost:8000
