FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com"}

  factory :user do
    first_name { "Klaus" }
    last_name { "Example" }
    email
    password { "klausklausklaus" }
    admin { false }
  end

  factory :admin, class: User do
    first_name { "Admin" }
    last_name { "User" }
    email
    password { "qwertzuiop" }
    admin { true }
  end
end
