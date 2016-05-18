require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET #new" do
    context "success" do
      subject { get :new}
      it "render the new template" do
        expect(subject).to render_template(:new)
      end
      it "returns a 200 ok status" do
        get :new
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET #index" do
    subject { get :index}
    it "render the index template" do
      expect(subject).to render_template(:index)
    end
    it "returns a 200 ok status" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
