class Type < ActiveRecord::Base
  default_scope :order => 'category'
  
  attr_accessible :category, :offering
  
  validates_uniqueness_of :category

  has_many :offerings
  has_many :upcoming_offerings, :class_name => 'Offering', :order => 'start_date ASC', :limit => 4
  
  def before_destroy
    self.offerings.destroy_all
  end

end
