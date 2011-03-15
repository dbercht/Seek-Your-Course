class User < ActiveRecord::Base
  validates_presence_of :last_name, :first_name
  attr_accessible :username, :last_name, :first_name, :password, :email, :admin
  acts_as_authentic
  
  has_and_belongs_to_many :offerings,  :join_table => 'offerings_users'
  
  has_many :coordinated_events, :class_name => 'Offering', :foreign_key => 'coordinator_id'
  
  def to_label
    self.first_name + " " + self.last_name
  end
  
  def before_create
    self.admin= false
    true
  end
  
end
