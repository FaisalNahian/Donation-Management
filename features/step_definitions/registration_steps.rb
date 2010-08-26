Before do
  include Authlogic::TestCase
  activate_authlogic
end

# USER REGISTRATION
#
Given /^there are no users with the email address (.*)$/ do |email|
  User.destroy_all
  assert_equal(0,User.count(:all, :conditions => ["email = (?)", email]))
end

Then /^there should be (\d+) user with the email address (.*)$/ do |count, email|
  assert_equal(count.to_i,User.count(:all, :conditions => ["email = (?)", email]))
end

Then /^the user with email address (.*) should not be active$/ do |email|
  assert_equal(1, User.count(:all, :conditions => ["email = (?) and active = ?", email, false]))
end

Then /^the user with email address (.*) should be active$/ do |email|
  assert_equal(1, User.count(:all, :conditions => ["email = (?) and active = ?", email, true]))
end

Then /^"([^"]*)" should be logged in$/ do |email|
  assert_equal( true, User.find_by_email( email ).logged_in? )
end

#
# PARTNER REGISTRATION
#
Given /^there are no partners with the email address (.*)$/ do |email|
  Partner.destroy_all
  assert_equal(0,Partner.count(:all, :conditions => ["email = (?)", email]))  
end

Then /^there should be (\d+) partner with the email address (.*)$/ do |count, email|
  assert_equal(count.to_i,Partner.count(:all, :conditions => ["email = (?)", email]))
end

Then /^the partner with email address (.*) should not be active$/ do |email|
  assert_equal(1,Partner.count(:all, :conditions => ["email = (?) and active = ?", email, false]))
end

Then /^"([^"]*)" should not be logged in$/ do |email|
  assert_equal( false, User.find_by_email( email ).logged_in? )
end

