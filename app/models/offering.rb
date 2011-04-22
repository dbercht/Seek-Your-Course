class Offering < ActiveRecord::Base
  attr_protected :validated, :note

  default_scope order('start_date')
  scope :future_offerings, where("start_date > ?", Date.today)
  scope :validated, future_offerings.where(:validated => true)
  scope :pending, future_offerings.where(:validated => false)
                      
  belongs_to :type
  belongs_to :location
  belongs_to :plan
  has_one :region, :through => :location
  
  has_and_belongs_to_many :topics
  has_and_belongs_to_many :registered_artists, :join_table => 'offerings_users', :class_name => "User" 

  belongs_to :coordinator, :class_name => "User", :foreign_key => "coordinator_id"
  
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

  validates_presence_of :title, :registration_begins, :link, :description, :start_date

 
  
  def validate
    errors[:base] = "#{plan.name} only allows for #{DESCRIPTION_LENGTH_FOR_PLAN[plan.name]} characters." if validate_plan_description_length?
    
    errors[:base] = "Must select type" if type_id.blank?

    errors[:base] = "Must select topic/medium" if topic_ids.blank?

    if !registration_deadline.blank?
      if (registration_begins > registration_deadline)
        errors[:base] = "Deadline must be after initial registration date"
      end
    end

    errors[:base] = "Dates must not be in the past" if ((registration_begins < Date.today)|(start_date < Date.today))

    errors[:base] = "Offering must start after registration deadline" if (start_date < registration_deadline)

  end

end
