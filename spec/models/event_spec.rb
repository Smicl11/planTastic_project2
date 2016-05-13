require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "#show" do

      before do
        get :show, id: event.id
      end

      it "assigns @event" do
        expect(assigns(:event)).to eq(event)
      end

      it "renders the :show view" do
        expect(response).to render_template(:show)
      end
    end
end
