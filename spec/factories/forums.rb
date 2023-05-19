require 'faker'

FactoryBot.define do
  factory :forum do
    name { Faker::Educator.course_name + " forum"}
    course_id { Faker::Number.number(digits: 2) }
  end
end
