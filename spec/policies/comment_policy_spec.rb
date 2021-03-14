require 'rails_helper'

RSpec.describe CommentPolicy, type: :policy do
  let!(:user) { create(:user) }

  let!(:public_project)     { create(:project) }
  let!(:private_project)    { create(:project, private: true) }
  let!(:my_private_project) { create(:project, private: true, user: user) }

  let!(:public_comment)     { create(:comment, project: public_project) }
  let!(:private_comment)    { create(:comment, project: private_project) }
  let!(:my_private_comment) { create(:comment, project: my_private_project, user: user) }

  subject { described_class }

  permissions ".scope" do
    it "returns all comments on public projects" do
      expect(CommentPolicy::Scope.new(user, Comment).resolve).to include(public_comment)
    end

    it "does not return comments on private projects" do
      expect(CommentPolicy::Scope.new(user, Comment).resolve).to_not include(private_comment)
    end

    it "returns all comments on my private projects " do
      expect(CommentPolicy::Scope.new(user, Comment).resolve).to include(my_private_comment)
    end
  end

  permissions :create? do
    context "the project is public" do
      it "grants access" do
        expect(subject).to permit(user, Comment.new(project: public_project))
      end
    end

    context "the project is private" do
      it "denies access" do
        expect(subject).to_not permit(user, Comment.new(project: private_project))
      end
    end
  end
end
