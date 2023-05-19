require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:user) {create(:user)}
  let(:course) {create(:course)}

  it 'is valid with valid attributes' do
    expect(course).to be_valid
  end

  it 'is not valid without a name' do
    course.name = nil
    expect(course).not_to be_valid
  end

  # it 'is not valid without a short name' do
  #   course.name = 'a'
  #   expect(course).not_to be_valid
  # end

  it 'is not valid without description' do
    course.description = nil
    expect(course).not_to be_valid
  end

  it 'is not valid without category' do
    course.category = nil
    expect(course).not_to be_valid
  end

  # it 'is not valid without user' do
  #   game.user_id = nil
  #   expect(game).not_to be_valid
  # end

end
