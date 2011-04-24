class Offering < ActiveRecord::Base
  attr_protected :validated, :note

  #SCOPES

  default_scope order('start_date')
  scope :future_offerings, where("start_date > ?", Date.today)
  scope :validated, future_offerings.where(:validated => true)
  scope :pending, future_offerings.where(:validated => false)
  
  #ASSOCIATIONS                      
  
  belongs_to :type
  belongs_to :location
  belongs_to :plan
  has_one :region, :through => :location
  
  has_and_belongs_to_many :topics
  has_and_belongs_to_many :registered_artists, :join_table => 'offerings_users', :class_name => "User" 

  belongs_to :coordinator, :class_name => "User", :foreign_key => "coordinator_id"
  
  #VALIDATIONS

  DESCRIPTION_LENGTH_FOR_PLAN = {
	"Basic" => 50,
	"Pro 1" => 200,
	"Pro 2" => 300
  }

  def validate_plan_description_length?
    description.length > DESCRIPTION_LENGTH_FOR_PLAN[plan.name]
  end

  def plan_description_length?
    DESCRIPTION_LENGTH_FOR_PLAN[plan.name]
  end
  
   validates :topics, :presence => true
  validates :type, :presence => true
  validates :link, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates :location, :presence => true
  validates :start_date, :presence => true, 
                         :date => {:after => :registration_begins} 
  validates :registration_begins, :presence => true,
                                  :date => {:after => Date.today}
  validates :registration_deadline, :date => {:after => :registration_begins}

  def validate
    #errors[:base] = "#{plan.name} only allows for #{DESCRIPTION_LENGTH_FOR_PLAN[plan.name]} characters." if validate_plan_description_length?
  end

end
