class Topic < ActiveRecord::Base
  has_and_belongs_to_many :offerings
  has_attached_file :image, :styles => {:thumb => ["115x115#", :png]},
 :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
  validates_uniqueness_of :category

  default_scope order('category')
end
