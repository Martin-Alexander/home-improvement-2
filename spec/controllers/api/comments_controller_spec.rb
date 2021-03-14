require "rails_helper"

RSpec.describe Api::CommentsController, type: :controller do
  render_views

  describe "GET #index" do
    let!(:project) { create(:project) }
    let!(:comment) { create(:comment, project: project) }

    before(:each) { get :index, format: :json, params: { project_id: project.id } }

    it "responds with success" do
      expect(response).to have_http_status(200)
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end

    it "assigns @comments to array of comments" do
      expect(assigns(:comments)).to include(comment)
    end
  end

end