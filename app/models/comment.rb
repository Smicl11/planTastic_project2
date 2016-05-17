class Comment < ActiveRecord::Base
  belongs_to :users
  belongs_to :events

  validates :description, presence:true, uniqueness: true

end
