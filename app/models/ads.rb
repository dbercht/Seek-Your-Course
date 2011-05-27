class Ads < ActiveRecord::Base
  has_attached_file :image, :styles => {:thumb => ["130x390", :png]},
 :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
  validates_attachment_presence :image
  validates_presence_of :url, :tag

  POSITIONS = ['above', 'below']
  HEIGHTS = [130, 260, 390]
end
