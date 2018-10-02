class User < ApplicationRecord
  has_many :book_users
  has_many :books, through: :book_users
  
  validates :email, uniqueness: true
                    #format: { with: /^.+@.+$/ }
end
