class Comment < ApplicationRecord
  # declares a one to one relationship with a userr and a post
  belongs_to :post
  belongs_to :user

  # Makes sure that the comment has text, so it wont't be empty
  validates :body, presence: true
end
