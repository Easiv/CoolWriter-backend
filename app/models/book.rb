class Book < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true,
                    length: { minimum: 5 }

  validates :author, presence: true,
                     length: { minimum: 3 }
end
