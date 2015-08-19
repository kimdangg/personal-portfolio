# Personal Portfolio

My personal portfolio website.

Made with Ruby on Rails.

Check out the website here: http://kimdang.herokuapp.com/

The heroku app already has a seeded admin. Sign in as admin with the following email and password:
Email: admin@admin.com
Password: admin

### Setup
clone the project into your desktop and go to the project folder in the terminal.
run postgres with the command
```
$ postgres
```
create the tables with:
```
$ rake db:create
$ rake db:migrate
```
then run the rails server with:
```
$ rails server
```
then go to localhost:3000 in your web browser to see the app up and running.


