# README

Theater Website Project Brief

### Database Structure
---
* Movies (Has Many Showtimes)
	- ID 5
	- Title (String) Spider-man
	- Description (Text)
	- Poster (String(URL))
	- Rating (String)
	- Length (Integer(Minutes))
	- Now Playing (Boolean)
* Auditoriums (Has Many Showtimes)
	- ID
	- Name (String)
	- Capacity (Integer)
* Showtimes (Belongs to Auditorium, Belongs to Movie, Has Many Orders)
	- ID
	- Time (Time)
	- Date (Date)
	- Movie_ID (Integer)
	- Auditorium_ID (Integer)
* Order (Has One Showtime)
	- ID (Ticket Number)
	- Showtime_ID (Integer)
	- Price (Float)
	- Email (String)
	- Credit Card Number (String)
	- Credit Card Expiration (String)
* Users
	- Admin
	- Email


### User Flow
---
* User is shown a list of movies with showtimes for specific day (starting with today) on the main page.
	- Movies index view
	- Sold out showtimes are unselectable and greyed out
* User selects movie is redirected to individual movie page.
	- Movie show view
		* Title
		* Description
		* Rating
		* Length
		* Cover Image
	- Displays unique showtimes with corresponding movie_id and date (starting with today, extending for one week)
* User selects showtime and is taken to checkout page
	- Order new page with showtime param
* User reviews ticket information and enters credit card number and email.
* Credit card number and email are validated.
	- JavaScript validation
* User makes purchase.
	- New order is created in database.
* User receives emailed receipt.
	- Mailer with showtime and ticket info.
		* Name
		* Movie
		* Date
		* Time
		* Price

### Admin Flow
---
* Admin logs into backend
	- Devise login page
* Admin selects from order, movie, or auditorium managers.

### Order Manager
---
* Admin can select between views:
	- All orders (sorted by ticket number)
		* Individual ticket number
		* Purchaser email
		* Purchaser payment info
		* Movie associated with individual ticket
			-Click movie to change to orders by movie
		* Date and time
		* Total sales
	- Orders by movie (sorted by date > time > ticket number)
		* Individual ticket number
		* Date and time
		* Purchaser email
		* Purchaser payment info
		* Total movie sales

### Movie Manager
---
* Admin can add movies (Movie new/create action)
	-Title
	-Description
	-Cover image
	-Rating
	-Length
	-Now Playing (boolean)
* Admin can edit movies (Movie edit/update action)
* Admin can remove movies (Movie delete/destroy action)

Auditorium Manager
---
* Admin can add auditoriums (Auditorium new/create action)
	- Name
	- Capacity
	- Now playing
		* Generates a dropdown list of movies with Now Playing set to true
		* Admin selects a movie (or no movie)
		* Admin selects dates through which the movie will play.
			- Cannot select past dates
			- http://www.eyecon.ro/bootstrap-datepicker/	
		* On create action, starting at theater opening time on first dates selected, showtimes are generated at intervals of 30 minutes longer than the length of the movie until theater closing time minus thirty minutes longer than the length of the movie for each date selected.
* Admin can edit auditoriums (Auditorium edit/update action)
	- Now playing
		* Generates a dropdown list of movies with Now Playing set to true. Value auto-filled to movie corresponding to showtimes with current auditorium_id and date.
		* Admin selects a movie (or no movie)
		* Admin selects dates through which the movie will play.
			- Cannot select past dates
				* JavaScript validation.
			- http://www.eyecon.ro/bootstrap-datepicker/
		* On update action, starting with the first date selected, if showtimes corresponding to that auditorium, are removed from the showtime database.
			- Starting at theater opening time on first date selected, showtimes are generated at intervals of 30 minutes longer than the length of the movie until theater closing time minus thirty minutes longer than the length of the movie.
* Admin can remove auditoriums (Auditorium delete/destroy action)
	- On destroy action, starting with the current day, if showtimes corresponding to that auditorium, are removed from the showtime database.


Admin Login
---
To log into the admin dashboard:
theatr.herokuapp.com/users/sign_in
#Email: admin@theatr.com
#Password: baklavaparachute