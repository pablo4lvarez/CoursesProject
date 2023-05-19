require 'faker'

FactoryBot.define do
  factory :user, class: User do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name}
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    profile_picture { Faker::LoremFlickr.image }
  end
end
