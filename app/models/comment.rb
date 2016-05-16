class Comment < ActiveRecord::Base
  belongs_to :users
  belongs_to :events

  attr_accessor :description

    def initialize
      @description = ''
    end

end
