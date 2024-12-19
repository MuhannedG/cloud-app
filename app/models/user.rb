class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # one to many relationship declartions for posts and commnents
  has_many :posts, dependent: :destroy
  has_many :commetns, dependent: :destroy
  # devise modules to authnticate users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
