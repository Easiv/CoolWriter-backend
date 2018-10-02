require 'rails_helper'

RSpec.describe Book, type: :model do
  
  it 'has the author name from factory' do
    book = create(:book)
    expect(book.author).to be_a(String)
  end
end