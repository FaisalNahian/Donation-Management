class User < ActiveRecord::Base
  acts_as_authentic

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :birthdate, :gender, :url_slug, 
                  :country_id, :province, :email, :password, 
                  :password_confirmation
  
  before_create :default_approved, :fake_data
  
  def fake_data
    # this is called because the user model is slimmed down for now
    self.country_id = 0
    self.url_slug = ''
  end
  
  def lock_access!
    self.locked = true
    self.save
  end
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    UserMailer.deliver_forgot_password(:email => self.email, :key => self.perishable_token)
  end

  def deliver_user_confirmation!
    reset_perishable_token!  
    UserMailer.deliver_confirm_account(:email => self.email, :key => self.perishable_token)
  end
  
  def default_approved
    self.approved = true
  end
  
  def name
    "#{self.firstname} #{self.lastname}"
  end
end
