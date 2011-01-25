class Contact < ActiveRecord::Base
  attr_accessible :name, :number, :email, :offering
  validates_presence_of :name

  belongs_to :offering, :dependent => :true
end
