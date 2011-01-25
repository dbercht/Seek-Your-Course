class Topic < ActiveRecord::Base
  attr_accessible :category, :offering
  
  validates_presence_of :category
  validate_uniqueness_of :category

  has_and_belongs_to_many :offerings
end
