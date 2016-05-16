class User < ActiveRecord::Base
  has_secure_password
  # has_many :events, :foreign_key => :creator_id
  # has_many :attendances, :foreign_key => :attendee_id
  # has_many :attended_events, :through => :attendances
  has_many :attendances
  has_many :events, through: :attendances

  has_many :comments

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
