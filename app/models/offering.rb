class Offering < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  attr_protected :validated, :note, :editable

  #SCOPES

  default_scope order('start_date')
  scope :future_offerings, where("start_date > ?", Date.today)
  scope :past_offerings, where("start_date <= ?", Date.today)
  scope :validated, future_offerings.where(:validated => true)
  scope :pending, future_offerings.where(:validated => false)

  #ASSOCIATIONS                      
  
  belongs_to :type
  belongs_to :location
  belongs_to :plan
  has_one :region, :through => :location
  
  has_and_belongs_to_many :topics
  has_and_belongs_to_many :registered_artists, :join_table => 'offerings_users', :class_name => "User" , :uniq => true

  belongs_to :coordinator, :class_name => "User", :foreign_key => "coordinator_id"

  has_attached_file :picture_main,
    :styles => {
    :snippet => ["50x50#"],
    :thumb=>   ["200x500", "png"]},
 :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"

  has_attached_file :picture_footer_left,
    :styles => {
    :thumb=>   ["200x500", "png"]},
 :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"

  has_attached_file :picture_footer_right,
    :styles => {
    :thumb=>   ["200x500", "png"]},
 :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
  
  #VALIDATIONS

  DESCRIPTION_LENGTH_FOR_PLAN = {
	"Basic" => 50,
	"Premium" => 200,
	"Professional" => 300
  }

  DESCRIPTION_LENGTH = [50, 200, 300]

  def validate_plan_description_length?
    description.scan(/\w+/).length > DESCRIPTION_LENGTH_FOR_PLAN[plan.name]
  end

  def plan_description_length?
    DESCRIPTION_LENGTH_FOR_PLAN[plan.name]
  end
  
  validates :topics, :presence => true
  validates :type, :presence => true
  validates :link, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates_acceptance_of :terms_of_use, :on => 'create'

  validates_presence_of :start_date, :end_date, :registration_begins, :registration_deadline
  validates :registration_deadline, :date => {:after => :registration_begins}, :unless => lambda {registration_deadline.nil?}

  validate :validate_length_of_description, :validate_online_location

  with_options :if => lambda {return type.category != "eCourse"} do |o|
    o.validates :specific_location, :presence => true
  end


  with_options :if => (:editable?) do |o|
    o.validates :start_date, :date => {:after => :registration_begins}
    o.validates :end_date, :date => {:after => :start_date}
  end

  def validate_length_of_description
    errors[:base] = "#{plan.name} only allows for #{DESCRIPTION_LENGTH_FOR_PLAN[plan.name]} words." if validate_plan_description_length?
  end

  def validate_online_location
    errors[:base] = "Ecourses must be located online" if ((type.category == "eCourse")&&(location.state != "Online"))
  end


end
