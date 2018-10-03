require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has only 1 book at the time in test' do
    book = create(:book)
    expect(Book.count).to eq(1)
  end

  it 'has all the fields' do
    book = create(:book)

    expect(book.title).to be_a(String)
    expect(book.author).to be_a(String)
    expect(book.description).to be_a(String)
    expect(book.page_count).to be_a(Integer)
  end

  it { should_not allow_values('aaaa').for(:title) } # Title has to be at least 5 chars
  it { should_not allow_values('aa').for(:author) } # Author has to be at least 3 chars
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should have_many(:users).through(:book_users) }
  it { should have_many(:pages) }
  it { should have_many(:book_users) }

  it 'books should have uniq titles' do
    book = create(:book, title: 'Hello World', author: 'XXX' )
    duplicate = build(:book, title: 'Hello World', author: 'XXX')

    expect(duplicate.valid?).to be_falsey
  end
end