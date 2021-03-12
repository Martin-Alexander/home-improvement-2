require 'rails_helper'

RSpec.describe ProjectPolicy, type: :policy do
  let!(:user)                { create(:user) }
  let!(:public_project)      { create(:project) }
  let!(:private_project)     { create(:project, private: true) }
  let!(:my_private_project)  { create(:project, private: true, user: user) }

  subject { described_class }

  permissions ".scope" do
    it "returns all public projects" do
      expect(ProjectPolicy::Scope.new(user, Project).resolve).to include(public_project)
    end

    it "returns your private projects" do
      expect(ProjectPolicy::Scope.new(user, Project).resolve).to include(my_private_project)
    end

    it "does not return private projects you dont own" do
      expect(ProjectPolicy::Scope.new(user, Project).resolve).to_not include(private_project)
    end
  end

  permissions :show? do
    context "public project" do
      it "grants access to anyone" do
        expect(subject).to permit(user, public_project)
      end
    end

    context "private project" do
      it "grants access to its owner" do
        expect(subject).to permit(user, my_private_project)
      end

      it "denies access to everyone else" do
        expect(subject).to_not permit(user, private_project)
      end
    end
  end

  permissions :create? do
    it "grants access to anyone" do
      expect(subject).to permit(user, Project.new)
    end
  end

  permissions :update?, :destroy? do
    it "grants access to its owner" do
      expect(subject).to permit(public_project.user, public_project)
    end

    it "denies access to everyone else" do
      expect(subject).to_not permit(user, public_project)
    end
  end
end
