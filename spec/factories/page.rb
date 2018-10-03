FactoryBot.define do
  factory :page do
    content { FFaker::LoremPL.sentence }
  end
end