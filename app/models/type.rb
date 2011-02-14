class Type < ActiveRecord::Base
  default_scope :order => 'category'
  
  attr_accessible :category, :offering
  
  validates_uniqueness_of :category

  has_many :offerings, :dependent => :delete_all
  has_many :upcoming_offerings, :class_name => 'Offering', :order => 'start_date ASC', :limit => 4
end
