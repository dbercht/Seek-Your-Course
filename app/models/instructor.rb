class Instructor < ActiveRecord::Base
  attr_accessible :last_name, :first_name, :offering
  validates_presence_of :last_name, :first_name
  
  belongs_to :offering

end
