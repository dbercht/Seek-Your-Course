class Contact < ActiveRecord::Base
  attr_accessible :name, :number, :email, :offering
  validates_presence_of :name
  validate
  belongs_to :offering, :dependent => :delete
  
  def validate
    errors.add_to_base "Must fill in an e-mail or contact number" if ((number.blank?) & (email.blank?))
  end
end
