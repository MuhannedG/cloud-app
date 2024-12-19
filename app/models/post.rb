class Post < ApplicationRecord
  # a one to one relationship between a post and a user
  belongs_to :user

  # one to many realtionship. One psot can have comments
  has_many :comments, dependent: :destroy

  # Makes sure that every post has a title and a body
  validates :title, presence: true
  validates :body, presence: true
end
