Before do
  include Authlogic::TestCase
  activate_authlogic
end

Given /^I have one user "([^"]*)" with password "([^"]*)"$/ do |email, password|
  admin = Admin.new(:email => email, :password => password, :password_confirmation => password)
  admin.reset_persistence_token
  admin.save
end

Given /^I am logged in as (.*)$/ do |email|
  password = 'testtest'

  Given %{I have one user "#{email}" with password "#{password}"}
  And %{I am on the new admin sessions page}
  When %{I fill in "admin_session_email" with "#{email}"}
  And %{I fill in "admin_session_password" with "#{password}"}
  And %{I press "Login"}
end

Given /^there are (\d+) users$/ do |count|
  User.destroy_all
  for i in 0..(count.to_i - 1)
    User.create(:email => "test#{i}@domain.com", :birthdate => Time.now, :country_id => 1, :lastname => 'Test', :firstname => 'Test', :gender => 'male', :url_slug => 'test', :password => 'testtest', :password_confirmation => 'testtest')
  end
end
