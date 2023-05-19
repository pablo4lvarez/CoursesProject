require 'faker'

FactoryBot.define do
  factory :course, class: Course do
    name { Faker::Educator.course_name }
    description { Faker::Lorem.sentence }
    category { Faker::Educator.subject }
    # user_id {Faker::Number.number(digits: 1)}
  end
end
