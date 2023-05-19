require 'rails_helper'

RSpec.describe Clase, type: :model do
  before(:all) do

    @clase = Clase.create(
      numero: 5,
      nombre: "nombre clase 5",
      contenido: "Nice class",
      course_id: 5
    )

    @user = User.create(
      name:  Faker::Name.first_name,
      last_name: Faker::Name.last_name ,
      email: Faker::Internet.email ,
      password: Faker::Internet.password ,
      profile_picture: Faker::LoremFlickr.image
    )
    @course = Course.create(
      name: Faker::Educator.course_name ,
      description: Faker::Lorem.sentence,
      category: Faker::Educator.subject
    )

  end

  it 'is not valid without attributes' do
    @clase.numero = nil
    expect(@clase).not_to be_valid
  end


end
