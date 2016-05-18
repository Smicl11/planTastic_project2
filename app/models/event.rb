class Event < ActiveRecord::Base
  has_many :attendances
  has_many :users, through: :attendances
  has_many :comments

  validates :event_date, :location, :title, presence:true
  validate :future_event?

  extend FriendlyId
  friendly_id :title, use: :slugged


    # adds an error if birth date is in the future
  def future_event?
    if event_date < Date.today
      errors.add(:event_date, "Must be in the future")
    end
  end
end
