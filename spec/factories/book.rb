FactoryBot.define do
  factory :book do
    cover { FFaker::Book.cover } 
    title { FFaker::Book.title }
    author { FFaker::Book.author }
    description { FFaker::Book.description }
    page_count { (1..500).to_a.sample }
  end
end