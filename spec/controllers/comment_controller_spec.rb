require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:signed_in_user) { FactoryGirl.create(:user) }
  let(:comments_count) { FactoryGirl.create(:comment)}
  let(:attr) { FactoryGirl.create(description: 'new description', contribution: 'new content') }

  before(:each) do
    patch :update, { id:@comment.id, comment:attr }
    @comment.reload
  end

  describe "GET #new" do
    it "assigns @comment" do
      get :new
      expect(assigns(:comment)).to be_instance_of(Comment)
    end

    it "renders the :new view" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "success" do
      it "adds new comment to current_user" do
        post :create, comment: {description: "I'm uber excited", contribution: "what are you bringing"}
        expect(signed_in_user.comments.count).to eq(articles_count + 1)
      end

      it "redirects to 'event_path' after successful create" do
        post :create, comment: { description: "description blah", contribution: "bringing blah"}
        expect(response.status).to be(302)
        expect(response.location).to match(/\/comments\/\d+/)
      end
    end

    context "failure" do
      it "redirects to 'new_comment_path' when create fails" do
        post :create, comment: { description: nil, contribution: nil }
        expect(respect).to redirect_to(new_comment_path)
      end
    end
  end

  describe "GET #edit" do
    it {should redirect_to edit_path}
  end


  describe "PATCH #update" do
    it { expect(:update).to redirect_to(@comment) }
    it { expect(@comment.description).to eql attr[:description] }
    it { expect(@comment.contribution).to eql attr[:contribution] }
  end

  describe "delete #destroy" do
    context "success" do
      it { expect(find_by_id(comment_id)).to eql(@comment) }
      it { expect(:destroy).to redirect_to(user_path) }
      it { expect(@comment.description).to eql attr[:description] }
      it { expect(@comment.contribution).to eql attr[:contribution] }
    end
  end

end
