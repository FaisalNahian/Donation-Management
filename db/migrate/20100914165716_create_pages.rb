class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string  :title
      t.string  :meta_keywords
      t.string  :meta_description
      t.string  :url_slug
      t.text    :body
      t.boolean :active, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
