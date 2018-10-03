require 'rails_helper'

RSpec.describe Page, type: :model do
  it 'has all the fields' do
    book = create(:book)
    page = create(:page, book: book)

    expect(page.content).to be_a(String)
  end

  it { should_not allow_values("a" * 301).for(:content) } # max 300 chars
  it { should allow_values("a" * 300).for(:content) }
  it { should belong_to(:book) }
end