require 'rails_helper'


RSpec.describe Post, type: :model do
  # Creates a user instance
  let(:user) { create(:user) }

  # Test to make sure that all required elements are present
  it 'is valid with valid attributes' do
    post = Post.new(title: 'Test Title', body: 'Test Body', user: user)
    expect(post).to be_valid
  end

  # Test to highlight that a post without a title is invalid
  it 'is not valid without a title' do
    post = Post.new(body: 'Test Body', user: user)
    expect(post).not_to be_valid
  end

  # Test to highlight that a post wihout a body is invalid
  it 'is not valid without a body' do
    post = Post.new(title: 'Test Title', user: user)
    expect(post).not_to be_valid
  end

  # Test to highlight that a post wihtout a user is invalid
  it 'is not valid without a user' do
    post = Post.new(title: 'Test Title', body: 'Test Body')
    expect(post).not_to be_valid
  end
end
