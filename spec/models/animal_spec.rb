require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'valid?' do

    it 'falso quando o nome está vazio' do

        @animal = Animal.new(name: '', sex: 'Macho', age: 0.8, pet_care: 'Rosiberto', city: 'Aranhaguera')

        result = @animal.valid?

        expect(result).to eq(false)
    end

    it 'falso quando o sexo está vazio' do

      @animal = Animal.new(name: 'Tatuina', sex: '', age: 0.8, pet_care: 'Rosiberto', city: 'Aranhaguera')

      result = @animal.valid?

      expect(result).to eq(false)
    end

    it 'falso quando a idade está vazia' do

      @animal = Animal.new(name: 'Tatuina', sex: 'Macho', age: '', pet_care: 'Rosiberto', city: 'Aranhaguera')

      result = @animal.valid?

      expect(result).to eq(false)
    end

    it 'falso quando o cuidador está vazio' do

      @animal = Animal.new(name: 'Tatuina', sex: 'Macho', age: 0.8, pet_care: '', city: 'Aranhaguera')

      result = @animal.valid?

      expect(result).to eq(false)
    end

    it 'falso quando a cidade está vazia' do

      @animal = Animal.new(name: 'Tatuina', sex: 'Macho', age: 0.8, pet_care: 'Rosiberto', city: '')

      result = @animal.valid?

      expect(result).to eq(false)
    end

    it 'verdadeiro quando não é passado a adoção' do

      @animal = Animal.new(name: 'Tatuina', sex: 'Macho', age: 0.8, pet_care: 'Rosiberto', city: 'Aranhaguera')

      result = @animal.valid?

      expect(result).to eq(true)
    end



  end
end
