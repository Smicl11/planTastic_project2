require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "comments need a description" do
    it(:description) {should_not == nil}
  end
end
