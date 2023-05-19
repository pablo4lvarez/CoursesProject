require 'faker'

FactoryBot.define do
  factory :resena, class: Resena do
    calificacion { Faker::Number.between(from: 1, to: 5) }
    contenido { Faker::Lorem.sentence }
  end
end
