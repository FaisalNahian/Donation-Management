class Page < ActiveRecord::Base
  validates_presence_of :url_slug
  validates_presence_of :title
  validates_presence_of :meta_description
  validates_presence_of :body
  
  validates_uniqueness_of :url_slug
  validates_uniqueness_of :title
  validates_uniqueness_of :meta_description
  
  def deactivate!
    self.active = false
    self.save
  end
end