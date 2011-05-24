class Type < ActiveRecord::Base
  has_many :offerings, :dependent => :destroy
  validates_uniqueness_of :category

end
