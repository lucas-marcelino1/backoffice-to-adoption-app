require 'rails_helper'

describe 'Usuário deleta animal' do

    it 'a partir da tela de detalhes' do

        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
        @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', user_pet_care: @user)

        visit(animals_path)
        click_on('Lasanha')
        click_on('Excluir adoção')

        expect(current_path).to eq(animals_path)
        expect(page).not_to have_content('Nome: Lasanha')
        expect(page).not_to have_content('Sexo: Macho')
        expect(page).not_to have_content('Idade: 3')
    end

    it 'e somente o animal selecionado' do

        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
        @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', user_pet_care: @user)
        @animal_second = Animal.create!(name: 'Ruby', sex: 'Fêmea', age: '12', city: 'Curitiba', user_pet_care: @user)

        visit(animals_path)
        click_on('Lasanha')
        click_on('Excluir adoção')

        expect(current_path).to eq(animals_path)
        expect(page).not_to have_content('Nome: Lasanha')
        expect(page).not_to have_content('Sexo: Macho')
        expect(page).not_to have_content('Idade: 3')
        expect(page).to have_content('Nome: Ruby')
        expect(page).to have_content('Cuidador: Oswaldo')
    end
end