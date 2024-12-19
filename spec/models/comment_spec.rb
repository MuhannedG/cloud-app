require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Creates a user instance
  let(:user) { create(:user) }
  # Creates a post instance
  let(:post) { create(:post, user: user) }

  # Test to make sure that all required elements are present
  it 'is valid with valid attributes' do
    comment = Comment.new(body: 'Test Comment', user: user, post: post)
    expect(comment).to be_valid
  end

  # Test to highlight that a comment without a body is invalid
  it 'is not valid without a body' do
    comment = Comment.new(user: user, post: post)
    expect(comment).not_to be_valid
  end

  # Test to highlight that a comment without a logged in user is invalid
  it 'is not valid without a user' do
    comment = Comment.new(body: 'Test Comment', post: post)
    expect(comment).not_to be_valid
  end

  # Test to highlight that a comment without a post relation is invalid
  it 'is not valid without a post' do
    comment = Comment.new(body: 'Test Comment', user: user)
    expect(comment).not_to be_valid
  end
end
