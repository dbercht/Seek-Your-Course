class User < ActiveRecord::Base
  ROLES = %w[instructor coordinator]
  CustomSites = %w[website facebook twitter blog]
  CustomLocations = %w[country postal_code street_address city_address phone_number]

  serialize :location, Hash
  serialize :websites, Hash
  
  attr_accessible :last_name, :first_name, :role, :institution_name, :location, :websites
  attr_protected :is_admin
  acts_as_authentic

  scope :artists, 	where(:role => ROLES[0]).order('username')
  scope :coordinators, 	where(:role => ROLES[1]).order('username') 

  has_and_belongs_to_many :offerings

  has_many :coordinated_offerings, :class_name => 'Offering', :foreign_key => 'coordinator_id'

  has_one :profile
  accepts_nested_attributes_for :profile

  validates_presence_of :first_name, :last_name, :street_address, :city_address, :postal_code, :country, :phone_number, :website

  with_options :if => lambda{ role == ROLES[1] } do |o|
    o.validates :institution_name, :presence => true
  end


  def to_param
    username
  end

  def self.find_by_username_or_email(login)
   find_by_username(login) || find_by_email(login)
  end

  def name
    first_name << " " << last_name
  end

  
  CustomSites.each do |method_name|
    define_method(method_name) do
      (self.websites ||= {})[method_name]
    end
    
    define_method("#{method_name}=") do |value|
      (self.websites ||= {})[method_name] = value
    end
  end

  
  CustomLocations.each do |method_name|
    define_method(method_name) do
      (self.location ||= {})[method_name]
    end
    
    define_method("#{method_name}=") do |value|
      (self.location ||= {})[method_name] = value
    end
  end


end
