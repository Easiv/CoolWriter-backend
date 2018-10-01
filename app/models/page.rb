class Page < ApplicationRecord
  belongs_to :book
  validates :book, presence: true

  validates :page, length: { maximum: 300 }
end
