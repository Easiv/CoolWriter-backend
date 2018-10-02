FactoryBot.define do
  factory :user do
    name { FFaker::NamePL.name } 
    photo_url { FFaker::Image.url }
    email { FFaker::Internet.email }
    isAdmin { FFaker::Boolean.maybe }
  end
end