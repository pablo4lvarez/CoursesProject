FactoryBot.define do
  factory :clase do
    numero { Faker::Number.number(digits: 1) }
    nombre { Faker::Educator.subject }
    contenido { Faker::Lorem.sentence }
  end
end
