class Book < ApplicationRecord
  has_many :pages
  has_many :book_users
  has_many :users, through: :book_users

  validates :title, presence: true,
                    uniqueness: true,
                    length: { minimum: 5 }

  validates :author, presence: true,
                     length: { minimum: 3 }

end
