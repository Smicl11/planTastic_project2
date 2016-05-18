require 'rails_helper'

RSpec.describe Event, type: :model do
  context "Every new event needs" do
    it(:location) {should_not == nil}
    it(:event_date) {should_not == nil}
  end
  context " with 2 or more comments" do
    it "orders them in chronologically" do
      event = Event.create!
      comment1 = event.comments.create!(description: "first comment")
      comment2 = event.comments.create!(description: "second comment")
      expect(event.reload.comments).to eq([comment1,comment2])
    end
  end
end
