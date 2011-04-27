class Topic < ActiveRecord::Base
  has_and_belongs_to_many :offerings
  has_attached_file :image, :styles => {:thumb => ["150x150", :png]}
  validates_uniqueness_of :category
end
