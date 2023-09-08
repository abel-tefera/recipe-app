require 'rails_helper'
require 'faker'

RSpec.describe Food, type: :model do
  subject do
    @fake_user = User.create!(name: Faker::Name.unique.name,
                              email: Faker::Internet.email,
                              password: '123456', password_confirmation: '123456')

    Food.new(name: 'Carrot',
             quantity: 1,
             measurement_unit: 'g',
             price: 10,
             user: @fake_user)
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'should have a numeric quantity' do
    subject.quantity = 'abc'
    expect(subject).to_not be_valid
  end
end
