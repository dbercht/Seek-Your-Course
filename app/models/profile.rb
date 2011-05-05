class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :picture, :styles => {:thumb => ["150x150", :png]}
  
  validates :phone_number, :numericality => true,
                           :allow_blank => true
end
