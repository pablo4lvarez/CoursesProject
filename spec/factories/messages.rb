require 'faker'

FactoryBot.define do
  factory :message do
    contenido { "MyText" }
    forum_id { Faker::Number.number(digits: 1) }
    user_id { Faker::Number.number(digits: 1) }
  end
end
