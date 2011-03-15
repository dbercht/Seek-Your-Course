class Offering < ActiveRecord::Base
  default_scope :order => 'registration_deadline,registration_begins', :condition => {:validated => :true}
  
  attr_accessible :title, :location_id, :specific_location, :registration_begins, :registration_deadline, :link, :description, :type_id, :topic_ids, :validated, :start_date, :plan_id, :unregistered_artists, :registered_artist_ids
 
  before_create :pend_offering
  validates_presence_of :title, :registration_begins, :link, :description, :start_date, :specific_location
  validate
  
  belongs_to :type
  belongs_to  :location
  has_one :region, :through => :location
  belongs_to  :plan
  
  has_and_belongs_to_many :topics
  has_and_belongs_to_many :registered_artists, :join_table => 'offerings_users', :class_name => "User" 
  
  belongs_to :coordinator, :class_name => "User", :foreign_key => "coordinator_id"

  def validate
    errors.add_to_base "Must select type" if type_id.blank?
    errors.add_to_base "Must select topic/medium" if topic_ids.blank?
    if !registration_deadline.blank?
      if (registration_begins > registration_deadline)
        errors.add_to_base "Deadline must be after initial registration date"
      end
    end
    errors.add_to_base "Dates must not be in the past" if ((registration_begins < Date.today)|(start_date < Date.today))
  end

  def pend_offering
    self.validated = false
    true
  end
  
end
