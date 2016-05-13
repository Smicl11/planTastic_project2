require 'rails_helper'

RSpec.describe EventsController, type: :controller do
    describe "#show" do
      it "renders the :show view" do
      event = Event.create({title:"Beach Party", location:"Muir Beach", event_date:"12/25/16", event_time:"5:00pm", description:"For Jesus' birthday?" })
        get :show, id: event.id
        expect(response).to render_template(:show)
    end
  end


end
