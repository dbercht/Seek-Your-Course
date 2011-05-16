class Ads < ActiveRecord::Base
  has_attached_file :image, :styles => {:thumb => ["130x390", :png]}
  validates_attachment_presence :image
  validates_presence_of :url, :tag
end
