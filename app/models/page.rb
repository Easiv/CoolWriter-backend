class Page < ApplicationRecord
  belongs_to :book
  validates :book, presence: true

  validates :content, length: { maximum: 300 }
end
