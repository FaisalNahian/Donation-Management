Given /^I am not authenticated$/ do
  visit('/user_sessions/destroy') # ensure that at least
end

Given /^there is (\d+) user with the email address (.*)$/ do |count, email|
  User.create!(:email => email, :birthdate => Time.now, :country_id => 1, :lastname => 'Test', :firstname => 'Test', :gender => 'male', :url_slug => 'test', :password => 'testtest', :password_confirmation => 'testtest')
end

# these next two are unneeded
#Then /^my password reset key should not be nil$/ do
#  assert_equal(1, User.count(:all, :conditions => ["email = 'test@domain.com' and perishable_token is not null"]))
#end
#
#Then /^my password reset token should be set to nil$/ do
#  assert_equal(1,User.count(:all, :conditions => ["email = 'test@domain.com' and perishable_token is null"]))
#end
