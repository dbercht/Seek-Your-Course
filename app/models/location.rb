class Location < ActiveRecord::Base
  belongs_to :region
  has_many :offerings, :conditions => {:validated => true}
  validates_presence_of :region_id, :state
  validates :state, :uniqueness => {:scope => :region_id}
end
