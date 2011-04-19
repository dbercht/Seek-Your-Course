class Offering < ActiveRecord::Base
  default_scope order('start_date')

  scope :validated, where(:validated => true)
  scope :pending, where(:validated => false)

  attr_protected :validated, :note
  validates_presence_of :title, :registration_begins, :link, :description, :start_date, :specific_location
  belongs_to :type
  belongs_to :location
  belongs_to :plan
  has_one :region, :through => :location
  
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
    errors.add_to_base "Offering must start after registration deadline" if (start_date < registration_deadline)
  end

end
