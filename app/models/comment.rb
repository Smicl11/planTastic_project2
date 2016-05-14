class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  attr_accessor :description

  def initialize
    @description = ''
  end
