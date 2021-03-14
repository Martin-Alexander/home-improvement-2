require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  render_views

  describe "GET #index" do
    let!(:project) { create(:project) }

    before(:each) { get :index }

    it "responds with success" do
      expect(response).to have_http_status(200)
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end

    it "assigns @projects to array of Projects" do
      expect(assigns(:projects)).to include(project)
    end
  end

  describe "GET #show" do
    let!(:project) { create(:project) }

    before(:each) { get :show, params: { id: project.id } }

    it "responds with success" do
      expect(response).to have_http_status(200)
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end

    it "assigns @project to the Project" do
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "GET #new" do
    let(:user) { create(:user) }

    before(:each) {
      sign_in(user)
      get :new
    }

    it "responds with success" do
      expect(response).to have_http_status(200)
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end

    it "assigns @project to a blank Project" do
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:user) { create(:user) }
      let(:valid_params) do
        {
          title: "My Title",
          description: "My Description",
          public: true,
          estimated_level_of_effort: 5,
          actual_level_of_effort: 5,
          status: Project::STATUS_CREATED
        }
      end

      let(:response) { post :create, params: { project: valid_params } }

      before(:each) { sign_in(user) }

      it "creates a new project" do
        expect { response }.to change(Project, :count).by(1)
      end

      it "redirects to project show" do
        expect(response).to redirect_to(project_path(Project.last))
      end
    end

    context "with invalid params" do
      let(:user) { create(:user) }
      let(:invalid_params) do
        {
          description: "My Description",
          public: true,
          estimated_level_of_effort: 5,
          actual_level_of_effort: 5,
          status: Project::STATUS_CREATED
        }
      end

      let(:response) { post :create, params: { project: invalid_params } }

      before(:each) { sign_in(user) }

      it "does not create a new project" do
        expect { response }.to change(Project, :count).by(0)
      end

      it "renders the :new template" do
        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:user)     { create(:user) }
    let!(:project)  { create(:project, user: user) }
    let(:response)  { delete :destroy, params: { id: project.id }}

    before(:each) { sign_in(user) }

    it "deletes the project" do
      expect { response }.to change(Project, :count).by(-1)
    end

    it "redirect to the home page" do
      expect(response).to redirect_to(root_path)
    end
  end

  # describe "PATCH #update" do
  #   context "with valid params" do
  #     let(:user)         { create(:user) }
  #     let(:project)      { create(:project, user: user)}
  #     let(:valid_params) { { title: "My Title 2" } }
  #     let(:response)     { patch :update, params: { id: project.id, project: valid_params } }

  #     before(:each) { sign_in(user) }

  #     it "creates a new project" do
  #       expect { response }.to change(Project, :title).to("My Title 2")
  #     end

  #     it "redirects to project show" do
  #       expect(response).to redirect_to(project_path(Project.last))
  #     end
  #   end

  #   context "with invalid params" do
  #     let(:user)           { create(:user) }
  #     let(:project)        { create(:project, user: user)}
  #     let(:invalid_params) { { title: nil } }
  #     let(:response)       { patch :update, params: { id: project.id, project: invalid_params } }

  #     before(:each) { sign_in(user) }

  #     it "creates a new project" do
  #       expect { response }.to_not change(Project, :title)
  #     end

  #     it "renders the :new template" do
  #       expect(response).to render_template :new
  #     end
  #   end
  # end
end