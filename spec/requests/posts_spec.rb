require 'rails_helper'

RSpec.describe "Posts", type: :request do
  # Creates a user and a post instances
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  # Signs in the user
  before do
    sign_in user
  end

  # Test for the GET /index route
  describe "GET /index" do
    it "returns http success" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  # Test for the POST /create route
  describe "POST /create" do
    it "creates a new post" do
      expect {
        post(posts_path, params: { post: { title: "New Post", body: "Post Contents" } })
      }.to change(Post, :count).by(1)
    end
  end

  # Tests for the DELETE /destroy route
  describe "DELETE /destroy" do
    it "deletes a post" do
      post
      expect {
        delete post_path(post)
      }.to change(Post, :count).by(-1)
    end
  end
end
