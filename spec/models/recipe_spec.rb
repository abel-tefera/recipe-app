require 'rails_helper'
require 'faker'

RSpec.describe Recipe, type: :model do
  subject do
    @fake_user = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '123456', password_confirmation: '123456')
    Recipe.new(name: 'Stew',
               preparation_time: '1 hr',
               cooking_time: '2 hr',
               description: 'YumYum',
               user: @fake_user)
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'should be valid' do
    expect(subject).to be_valid
  end
end
