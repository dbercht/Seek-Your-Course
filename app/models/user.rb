class User < ActiveRecord::Base
  validates_presence_of :last_name, :first_name
  attr_accessible :username, :last_name, :first_name, :password, :email, :admin
  acts_as_authentic
  has_and_belongs_to_many :offerings
  
  def before_create
    self.admin= false
    true
  end
  
end
