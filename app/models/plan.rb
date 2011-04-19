class Plan < ActiveRecord::Base
  has_many :offerings, :dependent => :destroy
  validates_uniqueness_of :name
end
