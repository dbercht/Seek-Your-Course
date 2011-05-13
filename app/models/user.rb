class User < ActiveRecord::Base
  ROLES = %w[instructor coordinator]

  serialize :location, Hash
  
  attr_accessible :last_name, :first_name, :role, :institution_name, :location
  attr_protected :is_admin
  acts_as_authentic

  scope :artists, 	where(:role => ROLES[0]).order('username')
  scope :coordinators, 	where(:role => ROLES[1]).order('username') 

  has_and_belongs_to_many :offerings

  has_many :coordinated_offerings, :class_name => 'Offering', :foreign_key => 'coordinator_id'

  has_one :profile
  accepts_nested_attributes_for :profile

  def to_param
    username
  end

  def self.find_by_username_or_email(login)
   find_by_username(login) || find_by_email(login)
  end

  def name
    first_name << " " << last_name
  end

end
