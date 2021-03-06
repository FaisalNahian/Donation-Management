class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :firstname
      t.string :lastname
      t.string :email, :null => false
      
      t.string    :crypted_password,    :null => false    # optional, see below
      t.string    :password_salt,       :null => false    # optional, but highly recommended
      t.string    :persistence_token,   :null => false    # required
      t.string    :single_access_token, :null => false    # optional, see Authlogic::Session::Params
      t.string    :perishable_token,    :null => false    # optional, see Authlogic::Session::Perishability

      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
      t.timestamps
    end
    Admin.create(:email => "admin@domain.com", :password => "password", :password_confirmation => "password", :firstname => "Test", :lastname => "Test")
  end

  def self.down
    drop_table :admins
  end
end
