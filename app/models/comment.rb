class Comment < ActiveRecord::Base
  attr_accessor :description

  def initialize
    @description = ''
  end
