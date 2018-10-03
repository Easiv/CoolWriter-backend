require 'rails_helper'

describe User, type: :model do
  it 'has all the fields' do
    user = create(:user)

    expect(user.name).to be_a(String)
    expect(user.photo_url).to be_a(String)
    expect(user.email).to be_a(String)
  end

  it { should have_many(:books) }
  it { should have_many(:books).through(:book_users) }

  it 'validates the email' do 
    email = create(:user, email: 'ixampl@succ.com')
    duplicate = build(:user, email: 'ixampl@succ.com')

    expect(duplicate.valid?).to be_falsey
  end
end