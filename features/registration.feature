Feature: Registration
  In order to use the site
  As a visitor
  I want to be able to create a new account

  @javascript
  Scenario: Successful User Signup
    Given there are no users with the email address test@domain.com
	And I am not authenticated
	And I am on the home page
	Then I should see "Welcome to"
	When I follow "Sign Up"
  	Then I should see "First Name"
	When I fill in the following:
		| user[firstname]             | Brian           |
		| user[lastname]              | McQuay          |
		| user[email]                 | test@domain.com |
		| user[password]              | testtest        |
		| user[password_confirmation] | testtest        |
		| user[url_slug]              | onomojo         |
		| user[gender]                | male            |
		| user[country_id]            | 1               |
		| user[province]              | Santa Cruz      |
	And I select "2005" from "user_birthdate_1i"
	And I select "January" from "user_birthdate_2i"
	And I select "1" from "user_birthdate_3i"
	And I press "Sign up"
	Then I should see "You have signed up successfully and will receive an email with instructions to verify your account"
	And there should be 1 user with the email address test@domain.com
	And the user with email address test@domain.com should not be active
	And "test@domain.com" should receive an email with subject "Account Confirmation"
	When I open the email
	Then I should see "Verify your account" in the email body
	When I follow "Verify your account" in the email
	Then I should see "Congratulations! Your account is now active."
	And the user with email address test@domain.com should be active
	And "test@domain.com" should be logged in

  @javascript
  Scenario: Successful Partner Signup
    Given there are no partners with the email address test@domain.com
	And I am on the home page
	And I am not authenticated
	When I follow "Partner Sign Up"
  	Then I should see "First Name"
	When I fill in the following:
		| user[firstname]             | Brian           |
		| user[lastname]              | McQuay          |
		| user[email]                 | test@domain.com |
		| user[password]              | testtest        |
		| user[password_confirmation] | testtest        |
		| user[url_slug]              | onomojo         |
		| user[organization]          | Save the Planet |
		| user[phone]                 | 808.222.2222 |
		| user[country_id]            | 1               |
		| user[province]              | Santa Cruz      |
	And I press "Sign up"
	Then I should see "Your partner organization application has been submitted"
	And there should be 1 partner with the email address test@domain.com
	And the partner with email address test@domain.com should not be active
	And "test@domain.com" should not be logged in

