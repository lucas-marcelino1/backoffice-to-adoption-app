require 'rails_helper'

describe 'Usuário deleta animal' do

    it 'a partir da tela de detalhes' do

        @pcare = PetCare.create!(name: 'Oswaldo', age: '21', email: 'oswaldo@gmail.com')
        @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', pet_care: @pcare)

        visit(animals_path)
        click_on('Lasanha')
        click_on('Excluir adoção')

        expect(current_path).to eq(animals_path)
        expect(page).not_to have_content('Nome: Lasanha')
        expect(page).not_to have_content('Sexo: Macho')
        expect(page).not_to have_content('Idade: 3')
    end

    it 'e somente o animal selecionado' do

        @pcare = PetCare.create!(name: 'Oswaldo', age: '21', email: 'oswaldo@gmail.com')
        @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', pet_care: @pcare)
        @animal_second = Animal.create!(name: 'Ruby', sex: 'Fêmea', age: '12', city: 'Curitiba', pet_care: @pcare)

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