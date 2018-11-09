FactoryBot.define do
  factory :user do
    first_name "Klaus"
    last_name "Example"
    email "klaus@example.com"
    password "klausklausklaus"
    admin false
  end
end
