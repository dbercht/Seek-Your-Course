class Type < ActiveRecord::Base

  default_scope order('category')

  has_many :offerings, :dependent => :destroy
  validates_uniqueness_of :category

end
