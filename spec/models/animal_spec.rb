require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'valid?' do

    it 'false when name is empty' do

        @animal = Animal.new(name: '', sex: 'Macho', age: 0.8, pet_care: 'Rosiberto', city: 'Aranhaguera')

        result = @animal.valid?

        expect(result).to eq(false)
    end

  end
end
