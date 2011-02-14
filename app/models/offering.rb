class Offering < ActiveRecord::Base
  default_scope :order => 'registration_deadline,registration_begins', :condition => {:validated => :true}
  
  attr_accessible :title, :location_id, :specific_location, :registration_begins, :registration_deadline, :link, :description, :type_id, :topic_ids, :validated, :start_date
 
  validates_presence_of :title, :registration_begins, :link, :description, :contact, :start_date, :location_id, :specific_location
  
  validate
  
  belongs_to :type
  belongs_to  :location
  has_and_belongs_to_many :topics
  has_many :instructors
  has_one :contact

  LOCATIONS = ["Alaska", "American Samoa", "Arizona", "Arkansas", " California", " Colorado", " Connecticut", " Delaware", " District of Columbia", " Florida", " Georgia", " Guam", " Hawaii", " Idaho", " Illinois", " Indiana", " Iowa", " Kansas", " Kentucky", " Louisiana", " Maine", " Maryland", " Massachusetts", " Michigan", " Minnesota", " Mississippi", " Missouri", " Montana", " Nebraska", " Nevada", " New Hampshire", " New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Northern Marianas Islands", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Virgin Islands", "Washington", "West Virginia", "Wisconsin", "Wyoming", "Abroad"]

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
  end

end
