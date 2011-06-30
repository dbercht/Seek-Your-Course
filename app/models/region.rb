class Region < ActiveRecord::Base
  default_scope :order => [:name]

  has_many :locations, :dependent => :destroy
  validates_uniqueness_of :name

	has_many :offerings, :through => :locations

  def to_param
    name.gsub(" ", "-")
  end

end
