class Offering < ActiveRecord::Base
  attr_accessible :title, :location, :state, :registration_begins, :registration_deadline, :link, :description, :type_id, :topic_ids, :validated
 
  validates_presence_of :title, :registration_begins, :link, :description, :contact
  
  validate
  
  belongs_to :type
  has_and_belongs_to_many :topics
  has_many :instructors
  has_one :contact

  LOCATIONS = ["Alabama", "Alaska", "American Samoa", "Arizona", "Arkansas", " California", " Colorado", " Connecticut", " Delaware", " District of Columbia", " Florida", " Georgia", " Guam", " Hawaii", " Idaho", " Illinois", " Indiana", " Iowa", " Kansas", " Kentucky", " Louisiana", " Maine", " Maryland", " Massachusetts", " Michigan", " Minnesota", " Mississippi", " Missouri", " Montana", " Nebraska", " Nevada", " New Hampshire", " New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Northern Marianas Islands", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Virgin Islands", "Washington", "West Virginia", "Wisconsin", "Wyoming", "Abroad"]

  def validate
    errors.add_to_base "Must select type" if type_id.blank?
    errors.add_to_base "Must select topic/medium" if topic_ids.blank?
    if !registration_deadline.blank?
      if (registration_begins > registration_deadline)
        errors.add_to_base "Deadline must be after initial registration date"
      end
    end
  end

  def pend_offering
    self.validated = false
  end

end
