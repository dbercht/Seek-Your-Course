class Location < ActiveRecord::Base
  default_scope :order => "state"
  named_scope :us_locations, :conditions => {:us_location => true}, :order => "locations.state ASC"
  named_scope :abroad_locations, :conditions => {:us_location => false}, :order => "state"
  attr_accessible :state, :us_location, :region_id
  
  has_many :offerings
  belongs_to :region
  
end
