class Topic < ActiveRecord::Base
  has_and_belongs_to_many :offerings
  validates_uniqueness_of :category
end
