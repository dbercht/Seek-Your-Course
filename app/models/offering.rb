class Offering < ActiveRecord::Base
  attr_accessible :title, :location, :state, :registration_begins, :registration_deadline, :link, :description
 
  validates_presence_of :title, :registration_begins, :link, :description
  
  belongs_to :type
  has_and_belongs_to_many :topics
  has_many :instructors
  has_one :contact
  
end
