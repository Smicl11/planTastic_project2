require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { Comment.create }

  describe ""
    it " is invalid without a description" do
      comment = Comment.new
      comment.should_not be_valid
    end
  end
