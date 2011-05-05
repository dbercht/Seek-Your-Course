class User < ActiveRecord::Base
  ROLES = %w[artist coordinator]
  
  attr_accessible :name, :role
  attr_protected :is_admin
  acts_as_authentic

  scope :artists, 	where(:role => ROLES[0]).order('username')
  scope :coordinators, 	where(:role => ROLES[1]).order('username') 

  has_and_belongs_to_many :offerings

  has_many :coordinated_offerings, :class_name => 'Offering', :foreign_key => 'coordinator_id'

  has_one :profile
  accepts_nested_attributes_for :profile

end
