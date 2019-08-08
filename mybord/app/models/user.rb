class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :username, presence: true, uniqueness: true, format: {with: /\A[a-zA-Z]+\z/ }
  validates :mail, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :introduce, presence: true, on: :update
end
