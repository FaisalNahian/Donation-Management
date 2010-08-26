class AddAuthlogicStates < ActiveRecord::Migration
  def self.up
    add_column :users, :confirmed, :boolean
    add_column :users, :approved, :boolean
  end

  def self.down
    remove_column :users, :confirmed
    remove_column :users, :approved
  end
end
