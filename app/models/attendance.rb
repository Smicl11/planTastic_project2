class Attendance < ActiveRecord::Base
  # belongs_to :attended_event, class_name: "Event"
  # belongs_to :attendee, class_name: "User"
  belongs_to :event
  belongs_to :user

end
