class User < ActiveRecord::Base
  acts_as_authentic
  has_and_belongs_to_many :offerings
  
  def before_save
    self.admin= false
    true
  end
  
end
