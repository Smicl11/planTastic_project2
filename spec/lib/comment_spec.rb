require "spec_helper"
require "Comment"

  describe Comment do
    it "has a description"
      comment = Comment.new
      comment.description.should != nil
    end
