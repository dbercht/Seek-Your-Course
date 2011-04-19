class User < ActiveRecord::Base
  attr_protected :is_admin
  acts_as_authentic

  has_and_belongs_to_many :offerings

  has_many :coordinated_offerings, :class_name => 'Offering', :foreign_key => 'coordinator_id'
end
