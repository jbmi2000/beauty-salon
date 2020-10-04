# Beauty Salon Stylist Customer Roster

This application is the beginning of a salon customer management system, which allows stylists to create their own unique user account with password, and manage their own list of customers.  Users of this application (salon stylists) will be able to:

1.  create a new customer.
2.  display information for that customer.
3.  edit customer information.
4.  display a complete list of their own customers.
5.  delete their own customers, as needed.  

## Installation



Clone the repo at https://github.com/jbmi2000/beauty-salon in github, to your local terminal environment and run the following commands:

1. `$ gem install bundler` ... to install [Bundler](https://bundler.io/)
2. `$ bundle install` ... to install the [Ruby Gems](https://rubygems.org/).
3. `$ shotgun` ... to boot up your server

Shotgun will execute the config.ru and display a domain for the application.  Copy this domain and paste it into you browser.  This will display the Welcome page for the Beauty Salon application.


## Usage

Once on the homepage, you will be given the following options:

1. Log in with your current username and password
	*The application will display a credentials error if either the case-sensitive username or password are not entered correctly.

2. Create a new username and password using the Sign Up button
	*When you create a new username and password, you will be redirected to the Login page to log in to the appication.

When logged in, you will be greeted by the username that you created and presented with the following options:

1. View my current customer list
2. Create a new customer
3. Log Out

When viewing your current customer list, you will be able to 

1. create a new customer, if the one you are looking for is not yet added
2. click on each customer to display additional information
	*On each customer page, you can edit, delete, or return to the customer list.
3. edit indiviual customer information
4. delete individual customers

Once logged in, all pages display the Log Out link at the top right corner.  Log Out is also presented in the body of the Welcome Page (Stylists Dashboard).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jbmi2000/beauty-salon. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jbmi2000/beauty-salon/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hairsalon project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jbmi2000/beauty-salon/blob/master/CODE_OF_CONDUCT.md).

