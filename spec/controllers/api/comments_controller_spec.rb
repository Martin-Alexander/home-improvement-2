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

  describe "POST #create" do
    context "with valid params" do
      let!(:user)    { create(:user) }
      let!(:project) { create(:project) }

      let(:response) { post :create, format: :json, params: { project_id: project.id, comment: { content: "My comment" } } }

      before(:each) { sign_in(user) }

      it "responds with success" do
        expect(response).to have_http_status(200)
      end

      it "creates a new project" do
        expect { response }.to change(Comment, :count).by(1)
      end

      it "render the :show template" do
        expect(response).to render_template :show
      end
    end

    context "with invalid params" do
      let!(:user) { create(:user) }
      let!(:project) { create(:project) }

      let(:response) { post :create, format: :json, params: { project_id: project.id, comment: { content: nil } } }

      before(:each) { sign_in(user) }

      it "responds with unprocessable entity" do
        expect(response).to have_http_status(422)
      end

      it "does not create a new project" do
        expect { response }.to change(Project, :count).by(0)
      end
    end
  end
end