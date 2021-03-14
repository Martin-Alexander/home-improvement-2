require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  render_views

  describe "POST #create" do
    context "with valid params" do
      let!(:user)    { create(:user) }
      let!(:project) { create(:project) }

      let(:response) { post :create, params: { project_id: project.id, comment: { content: "My comment" } } }

      before(:each) { sign_in(user) }

      it "creates a new project" do
        expect { response }.to change(Comment, :count).by(1)
      end

      it "redirects to project show" do
        expect(response).to redirect_to(project_path(project))
      end
    end

    context "with invalid params" do
      let!(:user) { create(:user) }
      let!(:project) { create(:project) }

      let(:response) { post :create, params: { project_id: project.id, comment: { content: nil } } }

      before(:each) { sign_in(user) }

      it "does not create a new project" do
        expect { response }.to change(Project, :count).by(0)
      end

      it "renders the \"projects/show\" template" do
        expect(response).to render_template "projects/show"
      end
    end
  end
end