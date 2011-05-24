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

  validates_length_of :description, :maximum => 100, :tokenizer => lambda { |str| str.scan(/\w+/) }
  validates :description, :presence => true
  validates :focus, :length => {:maximum => 90}, :presence => true

  with_options :if => lambda {return role == User::ROLES[1]} do |o|
    o.validates :type, :presence => true
    o.validates :frequency, :presence => true
    o.validates :specific_location, :presence => true
  end
  validates_attachment_size :picture, :less_than => 5.megabyte
  validates_attachment_size :picture1, :less_than => 5.megabyte
  validates_attachment_size :picture2, :less_than => 5.megabyte
  validates_attachment_size :picture3, :less_than => 5.megabyte
  validates_attachment_size :picture4, :less_than => 5.megabyte
  validates_attachment_presence :picture

  CustomFields.each do |method_name|
    define_method(method_name) do
      (self.preferences ||= {})[method_name]
    end
    
    define_method("#{method_name}=") do |value|
      (self.preferences ||= {})[method_name] = value
    end
  end


end
