class Region < ActiveRecord::Base
  default_scope :order => 'name'
  
  attr_accessible :name, :location
  has_many :locations
  has_many :offerings
end
