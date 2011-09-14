class Profile < ActiveRecord::Base
  CustomFields = %w(email blog facebook twitter flickr)
  CoordinatorType = %w(retreat conference)

  belongs_to :user


	accepts_nested_attributes_for :user

  has_attached_file :picture, :styles => {:thumb => ["115x115#", :png], :regular => ["200x200#", :png]},
 :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
  has_attached_file :picture1, :styles => {:thumb => ["115x115#", :png], :regular => ["200x200", :png]},
 :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
  has_attached_file :picture2, :styles => {:thumb => ["115x115#", :png], :regular => ["200x200", :png]},
 :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
  has_attached_file :picture3, :styles => {:thumb => ["115x115#", :png], :regular => ["200x200", :png]},
 :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
  has_attached_file :picture4, :styles => {:thumb => ["115x115#", :png], :regular => ["200x200", :png]},
 :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"

  serialize :preferences, Hash  


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

  validate :validate_length_of_description, :validate_length_of_testimonial

  def validate_description_length?
    description.scan(/\w+/).length > 200
  end

  def validate_testimonial_length?
    (testimonials.scan(/\w+/).length > 100) unless testimonials.nil?
  end

  def validate_length_of_description
    errors[:base] = "Description must be at most 100 words." if validate_description_length?
  end

  def validate_length_of_testimonial
    errors[:base] = "Testimonial must be at most 100 words." if validate_testimonial_length?
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
