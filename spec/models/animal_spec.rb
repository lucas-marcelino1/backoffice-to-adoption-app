require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'valid?' do

    it 'falso quando o nome está vazio' do
      @user = UserPetCare.create!(name: 'Júlia', city: 'Blumenau', email: 'julia@gmail.com', password: '123456')
      @animal = Animal.create(name: '', sex: 'Macho', city: 'Blumenau', user_pet_care: @user, age: '0.8')

        result = @animal.valid?

        expect(result).to eq(false)
    end

    it 'verdadeiro quando o sexo está vazio' do

      @user = UserPetCare.create!(name: 'Júlia', city: 'Blumenau', email: 'julia@gmail.com', password: '123456')
      @animal = Animal.create(name: 'Tunico', sex: '', city: 'Blumenau', user_pet_care: @user, age: '0.8')

      result = @animal.valid?

      expect(result).to eq(true)
    end

    it 'falso quando a idade está vazia' do
      @user = UserPetCare.create!(name: 'Júlia', city: 'Blumenau', email: 'julia@gmail.com', password: '123456')
      @animal = Animal.create(name: 'Tunico', sex: 'Macho', city: 'Blumenau', user_pet_care: @user, age: '')

      result = @animal.valid?

      expect(result).to eq(false)
    end

    it 'falso quando o cuidador não existe' do

      @animal = Animal.create(name: 'Tatuina', sex: 'Macho', age: 0.8, user_pet_care: @pcare, city: 'Aranhaguera')

      result = @animal.valid?

      expect(result).to eq(false)
    end

    it 'falso quando a cidade está vazia' do
      @user = UserPetCare.create!(name: 'Júlia', city: 'Blumenau', email: 'julia@gmail.com', password: '123456')
      @animal = Animal.create(name: 'Tunico', sex: 'Macho', city: '', user_pet_care: @user, age: '0.8')

      result = @animal.valid?

      expect(result).to eq(false)
    end

    it 'verdadeiro quando não é passado a adoção' do
      @user = UserPetCare.create!(name: 'Júlia', city: 'Blumenau', email: 'julia@gmail.com', password: '123456')
      @animal = Animal.new(name: 'Tatuina', sex: 'Macho', age: 0.8, user_pet_care: @user, city: 'Aranhaguera')

      result = @animal.valid?

      expect(result).to eq(true)
    end



  end
end
