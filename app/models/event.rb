class Event < ActiveRecord::Base
  has_many :attendances
  has_many :users, through: :attendances
  has_many :comments

  extend FriendlyId
  friendly_id :title, use: :slugged
end
