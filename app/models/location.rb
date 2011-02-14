class Location < ActiveRecord::Base
  named_scope :us_locations, :conditions => {:us_location => true}, :order => 'state'
  named_scope :abroad_locations, :conditions => {:us_location => false}, :order => 'state'
  attr_accessible :state, :us_location
  
  has_many :offerings
end
