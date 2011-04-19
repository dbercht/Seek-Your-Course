class Region < ActiveRecord::Base
  has_many :locations, :dependent => :destroy
  validates_uniqueness_of :name
end
