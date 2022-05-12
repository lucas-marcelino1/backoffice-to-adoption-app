require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'valid?' do

    it 'falso quando o nome está vazio' do
        @pcare = PetCare.create!(name: 'Júlia', age: '21', email: 'juliarezende@gmail.com')
        @animal = Animal.new(name: '', sex: 'Macho', age: 0.8, pet_care: @pcare, city: 'Aranhaguera')

        result = @animal.valid?

        expect(result).to eq(false)
    end

    it 'falso quando o sexo está vazio' do

      @pcare = PetCare.create!(name: 'Júlia', age: '21', email: 'juliarezende@gmail.com')
      @animal = Animal.new(name: 'Tatuina', sex: '', age: 0.8, pet_care: @pcare, city: 'Aranhaguera')

      result = @animal.valid?

      expect(result).to eq(false)
    end

    it 'falso quando a idade está vazia' do
      @pcare = PetCare.create!(name: 'Júlia', age: '21', email: 'juliarezende@gmail.com')
      @animal = Animal.new(name: 'Tatuina', sex: 'Macho', age: '', pet_care: @pcare, city: 'Aranhaguera')

      result = @animal.valid?

      expect(result).to eq(false)
    end

    it 'falso quando o cuidador não existe' do

      @animal = Animal.create(name: 'Tatuina', sex: 'Macho', age: 0.8, pet_care: @pcare, city: 'Aranhaguera')

      result = @animal.valid?

      expect(result).to eq(false)
    end

    it 'falso quando a cidade está vazia' do
      @pcare = PetCare.create!(name: 'Júlia', age: '21', email: 'juliarezende@gmail.com')
      @animal = Animal.new(name: 'Tatuina', sex: 'Macho', age: 0.8, pet_care: @pcare, city: '')

      result = @animal.valid?

      expect(result).to eq(false)
    end

    it 'verdadeiro quando não é passado a adoção' do
      @pcare = PetCare.create!(name: 'Júlia', age: '21', email: 'juliarezende@gmail.com')
      @animal = Animal.new(name: 'Tatuina', sex: 'Macho', age: 0.8, pet_care: @pcare, city: 'Aranhaguera')

      result = @animal.valid?

      expect(result).to eq(true)
    end



  end
end
