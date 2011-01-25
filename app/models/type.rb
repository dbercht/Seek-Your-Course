class Type < ActiveRecord::Base
  attr_accessible :category, :offering
  
  validates_uniqueness_of :category

  has_many :offerings
end
