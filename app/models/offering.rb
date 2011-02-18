class Offering < ActiveRecord::Base
  default_scope :order => 'registration_deadline,registration_begins', :condition => {:validated => :true}
  
  attr_accessible :title, :location_id, :specific_location, :registration_begins, :registration_deadline, :link, :description, :type_id, :topic_ids, :validated, :start_date, :region_id, :plan_id
 
  before_create :pend_offering
  validates_presence_of :title, :registration_begins, :link, :description, :start_date, :region_id, :specific_location
  validate
  
  belongs_to :type, :dependent => :destroy
  belongs_to  :location, :dependent => :destroy
  belongs_to  :region, :dependent => :destroy
  belongs_to  :plan
  
  has_and_belongs_to_many :topics
  
  has_many :instructors

  def validate
    errors.add_to_base "Must select type" if type_id.blank?
    errors.add_to_base "Must select topic/medium" if topic_ids.blank?
    if !registration_deadline.blank?
      if (registration_begins > registration_deadline)
        errors.add_to_base "Deadline must be after initial registration date"
      end
    end
    if(location_id.blank?)
      if(region_id == 2)
        errors.add_to_base "Please select a state"
      end
    end
    errors.add_to_base "Dates must not be in the past" if ((registration_begins < Date.today)|(start_date < Date.today))
  end

  def pend_offering
    self.validated = false
    true
  end
  
end
