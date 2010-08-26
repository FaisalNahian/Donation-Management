class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string  :firstname, :null => false
      t.string  :lastname, :null => false
      t.string  :email, :null => false
      t.string  :url_slug, :null => false
      t.string  :gender
      t.string  :phone
      t.string  :organization
      t.string  :description      
      t.date    :birthdate
      t.integer :country_id, :null => false
      t.string  :province
      t.boolean :active, :default => false, :null => false

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
      t.boolean   :locked,           :default => false
      t.timestamps
    end

    add_index :users, :perishable_token  
    add_index :users, :email
  end

  def self.down
    drop_table :users
  end
end
