class Topic < ActiveRecord::Base
  default_scope :order => 'category'
  
  attr_accessible :category, :offering, :image_file_name
  
  validates_presence_of :category
  validates_uniqueness_of :category

  has_and_belongs_to_many :offerings, :conditions => {:validated => true}
  has_and_belongs_to_many :upcoming_offerings, :class_name => 'Offering', :order => 'start_date ASC', :limit => 4, :conditions => {:validated => true}
end
