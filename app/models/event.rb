class Event < ActiveRecord::Base
  has_many :attendances
  has_many :users, through: :attendances
  has_many :comments

  def change_event
  end

  
end
