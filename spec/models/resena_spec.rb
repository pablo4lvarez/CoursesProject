require 'rails_helper'
require 'faker'

RSpec.describe Resena, type: :model do
  before(:all) do

    @resena = Resena.create(
      calificacion: 5,
      contenido: "Nice!"
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


  # it 'is valid with valid attributes' do
    
  #   expect(@resena).to be_valid
  # end

  it 'is not valid without calificaion' do
    
    @resena.calificacion = nil
    expect(@resena).not_to be_valid
  end

  # EN UNA DE ESAS AGREGAR MAS?

end
