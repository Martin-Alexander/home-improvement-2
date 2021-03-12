require "rails_helper"

RSpec.describe LandingPagesController, type: :controller do
  render_views

  describe "GET #show" do
    let(:response) { get :show }

    it "responds with success" do
      expect(response).to have_http_status(200)
    end
  end
end