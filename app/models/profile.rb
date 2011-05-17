class Profile < ActiveRecord::Base
  CustomFields = %w(email blog facebook twitter)
  CoordinatorType = %w(retreat conference)

  belongs_to :user
  has_attached_file :picture, :styles => {:thumb => ["115x115#", :png], :regular => ["200x200#", :png]}
  has_attached_file :picture1, :styles => {:thumb => ["150x150#", :png], :regular => ["200x200", :png]}
  has_attached_file :picture2, :styles => {:thumb => ["150x150#", :png], :regular => ["200x200", :png]}
  has_attached_file :picture3, :styles => {:thumb => ["150x150#", :png], :regular => ["200x200", :png]}
  has_attached_file :picture4, :styles => {:thumb => ["150x150#", :png], :regular => ["200x200", :png]}

  serialize :preferences, Hash  

  validates_attachment_presence :picture
  
  validates :description, :length => {:maximum => 100}
  validates :focus, :length => {:maximum => 90}

  with_options :if => lambda {return role == User::ROLES[1]} do |o|
    o.validates :type, :presence => true
    o.validates :frequency, :presence => true
    o.validates :specific_location, :presence => true
  end

  CustomFields.each do |method_name|
    define_method(method_name) do
      (self.preferences ||= {})[method_name]
    end
    
    define_method("#{method_name}=") do |value|
      (self.preferences ||= {})[method_name] = value
    end
  end


end
