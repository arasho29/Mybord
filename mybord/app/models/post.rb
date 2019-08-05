class Post < ApplicationRecord

  belongs_to :user
  validates :name, presence: true, format: {with: /\A[a-zA-Z]+\z/ }
  validates :mail, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :message, presence: true  
end
