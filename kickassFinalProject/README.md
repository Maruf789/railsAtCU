Kickassfinalproject
================

This is the final project for Rails class. The name of this app is called "kickassFinalProject" (too silly, I know!). This application requires:

- Ruby 2.2.3
- Rails 4.2.4

These are the following features I have implemented in this app.

MUST FEATURES
--------------

1. Made a pull request against my pair's repository (Nina Baculinao, https://github.com/blanksblanks/project-rails) with an update to her README. Wrote "Ruby on Rails, Fall 2015" at the bottom of the file. My pair Nina is not officially registered for this class, so I am not sure whether he had to do the final project or not, but since her repository is public, I was able to do the pull request. But I'm not sure if she would do a pull request on my repo or not.

2. Users can select items (in this case, their favorite movie/TV show lists) from their collection to create a page displaying the selection that can be shared. The page is publicly accessible, so it doesn't require authentication.

3. A user is directed to a friendly "homepage"/"dashboard" page after she//he loggs in.

ADDITIONAL FEATURES
--------------------

4. Deployed this app to heroku. Here's the website: 

5. Used Twitter Bootstrap (3.3) to make your app look nice.

6. This application provides:

		- Navigation bar
		- Sign up (Create account)
		- Login
	
7. This app uses "devise" gem, which allows users to edit their user profile, for example, change their passwords, email address, name, etc. A user can also delete/cancel his/her account anytime (by clicking the "Edit Account" tab in the navigation bar). 

8. 	The “Forgot password?” feature allows a user to be emailed a reset password link to his/her email if he/she forgets his/her password.

9.  The “Remember me” feature uses cookies to allow a user to stay logged in.

10. This app uses 'simple_enum' gem, which adds role-based authorization and allows admin to limit access to pages based on user role. With this application: 

		- an admin can see a list of users
		- an admin can change a user’s role
		- an ordinary user can’t see a list of users
		- an ordinary user can’t change their role
		- an ordinary user can’t see (or edit) another user’s profile
		- an ordinary user can see (and edit) their own user profile


Documentation 
--------------

# Admin log in info: (to see the full features of role-based authorization)
	
		Email: rails@columbia.edu
		Password: abc12345

Alternatively, if you fork this app to your localhost, running "rake db:seed" will load the admin log in info to the database, so you can log in as an admin. Or you can sign up as an ordinary user.