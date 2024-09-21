# Virtual-Web-Application-Development
## Description of web application
After deciding upon a specific web application architecture, the entire project was classified into different
pages with various features as shown below.
### Home Page
Upon opening the company’s web application, the home page would be the first thing the user encounters.
The user can then choose from the navigation at the top right corner all the services provided. The
navigation drop down menu includes a link to the home page, the contact us page, the reviews page, the
consultation booking page, the logging in page and finally the creating an account page. Another feature
in the home page is the page footer which will be seen on almost all pages. The page footer includes a
navigation bar; however, this navigation bar is different than the top one in shape, color, and services
provided. The final feature within the home page is the book appointment button and is accompanied by a
link that redirects the user to the newsletter subreption page.
### Newsletter
Regarding the newsletter subscription form, it can be easily accessed from several features in the web
application. Starting with the home which includes three separate links for the subscription form; and
ending with any page that includes a page footer or the navigation bar. The newsletter subscription form
consists of only one input field which is used by the user to type in their email, on clicking the subscribe
button several validations are checked if the input is valid then the page
automatically redirects the user to the home page, this entire process is called CREATE operation where
the user enters input an upon doing an action the inputted information is inserted in the database.
### Login
As for the Login page which can be accessed view the navigation bar at the top right corner alongside
some links in the create your account page and change password page. The instant when the user clicks
on the login link, they are redirected to a form which includes two input fields for the email while the
other is for password. In addition, two links can be seen one redirects the user to the create account page
while the other redirects them to the change password page. Upon clicking on the login button some
validations are run on the server side in order to make sure of the user’s integrity. If all validations run
smoothly the user is directly sent to the home page; however, if the validations are compromised an error
message appears under each input box explaining the error. The validations run in the backend uses the
READ operation to select from the database then compare the results using php syntax and continue it is
defined course of action.
### Create your account.
A separate page is the create your account page which can be accessed from the navigation drop down list
in home page and through a link in the login page. The user is required to enter his first two names, last
name, Email, Password, password confirmation, and check the terms and services box. Upon clicking
create account various validations are done some of which are the emptiness check on all fields, the email
validation check which validates the email verification, the password length check, the confirm password
validation which compares the values of the password and password confirmation and if they are not a
match an error message appears below the text box. This entire process uses the CREATE operation
which gathers input and inserts it in the database as mentioned above.
### Reserving a consultation
In regard to the consultation reserving page, it can be accessed through the home via the book
appointment button and through the page footer. After redirecting to the Consultation form page, the user
is then asked to type in the service which they need consultation in and if in the case of any question there
is a message box to submit them.
### Contact us
Another page is the contact page which views our office location on google maps and every
communication method available which includes the firm’s email, phone number, and our location. At the
bottom of the page the footer can be seen and facilitates the user navigation experience.
### Reviews
The reviews page shows our customers’ opinion about the attorneys with complete details so that if a new
user cannot decide upon a representative then this page allows them to have a clear overview of our top
attorneys.
### Profile
As for the Profile page which will only appear in the navigation drop down menu if the user is logged in,
upon opening the page the user observers their information displayed and below them are wo buttons one
allows the password change, which implements the UPDATE operation. The other allows the entire
deletion of the account from the database upon the click of a button; and this includes DELETE operation,
which removes entire row from database by using the session information.
### Log Out
The log out link redirects the user to a php file that ends the user’s session all within seconds and after
that the screen returns to the home page.
### Change Password
And lastly for the change password page which include the UPDATE operation. The user can access this
page through the link in the login form or through the change password button in the profile page. After
the screen is redirected to the change password form the user is required to input his email, new password,
and confirmation to new password. The email is then validated if it already exists in the database if not an
error message appears below the text box. As for the password validation it verifies that the password
length is not shorter than eight characters. And lastly for the password confirmation validation it compares
the password and password confirm values. If they match then the form goes through and the password is
updated in the database if not then an error message appears below the textbox.
