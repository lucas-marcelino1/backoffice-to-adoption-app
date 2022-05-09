require 'rails_helper'

describe 'Usuário deleta adoção de animal' do

    it 'a partir da tela de detalhes' do

        @animal = Animal.create!(name: 'Godofreda', sex: 'Fêmea', age: '3', city: 'Concórdia', pet_care: 'Edilaine')

        visit(root_path)
        click_on('Godofreda')
        click_on('Excluir adoção')

        expect(current_path).to eq(root_path)
        expect(page).not_to have_content('Nome: Godofreda')
        expect(page).not_to have_content('Sexo: Fêmea')
        expect(page).not_to have_content('Idade: 3')
    end

    it 'e somente a adoção selecionada' do

        @animal = Animal.create!(name: 'Godofreda', sex: 'Fêmea', age: '3', city: 'Concórdia', pet_care: 'Edilaine')
        @animal_second = Animal.create!(name: 'Ruby', sex: 'Fêmea', age: '12', city: 'Curitiba', pet_care: 'Kléber')

        visit(root_path)
        click_on('Godofreda')
        click_on('Excluir adoção')

        expect(current_path).to eq(root_path)
        expect(page).not_to have_content('Nome: Godofreda')
        expect(page).not_to have_content('Sexo: Fêmea')
        expect(page).not_to have_content('Idade: 3')
        expect(page).to have_content('Nome: Ruby')
        expect(page).to have_content('Cuidador: Kléber')
    end
end