require 'rails_helper'

RSpec.describe Event, type: :model do
  context "Every new event needs" do
    it(:location) {should_not == nil}
    it(:event_date) {should_not == nil}
  end
end
