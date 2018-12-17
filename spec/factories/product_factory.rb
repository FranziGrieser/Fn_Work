FactoryBot.define do
  sequence(:name) { |n| "bike #{n}}" }

  factory :product do
    name
    description { "a test" }
    image_url { "https//:asdtest.de" }
    color { "testcolor" }
    price { 1000 }
  end
end
