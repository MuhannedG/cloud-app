class Event < ApplicationRecord
  
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
end
