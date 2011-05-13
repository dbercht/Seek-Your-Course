class Region < ActiveRecord::Base
  default_scope :order => [:name]

  has_many :locations, :dependent => :destroy
  validates_uniqueness_of :name

  def to_param
    name.gsub(" ", "-")
  end

end
