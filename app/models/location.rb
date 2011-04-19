class Location < ActiveRecord::Base
  belongs_to :region
  validates_presence_of :region_id, :state
  validates :state, :uniqueness => {:scope => :region_id}
end
