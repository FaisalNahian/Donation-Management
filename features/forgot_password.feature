Feature: Forgot Password
  In order to login when I forgot my password
  As a visitor
  I want to be able to retrieve my password

  @javascript
  Scenario: Send Password
    Given there is 1 user with the email address test@domain.com
	  And I am on the home page
	  When I follow "Login"
    Then I should see "Forgot password?"
    When I follow "Forgot password?"
    Then I should see "Fill out the form below and instructions to reset your password will be emailed to you"
    And I should see "Home"
    When I fill in "email" with "test@domain.com"
    And I press "Reset my password"
    Then I should see "Instructions to reset your password have been emailed to you"
    Then "test@domain.com" should receive an email with subject "Password Retrieval"
    And "test@domain.com" should receive an email
    # test isn't very useful as authlogic manages the perishable_token on its own
    # http://github.com/binarylogic/authlogic/blob/master/lib/authlogic/acts_as_authentic/perishable_token.rb:27-29
    #And my password reset key should not be nil
    When I open the email
    Then I should see "Forgot your password" in the email body
    When I follow "reset your password" in the email
    Then I should see "Change Password"
    When I fill in "user[password]" with "testtest"
    And I fill in "user[password_confirmation]" with "testtest"
    And I press "Change my password"
    Then I should see "Your password was changed successfully"
    # the next test shouldn't be needed
    #And my password reset token should be set to nil
