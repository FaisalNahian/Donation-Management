class Admin < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation
end
