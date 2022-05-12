require 'rails_helper'


describe 'Usuário visualiza animal para adoção a partir da tela inicial' do 

    it 'e visualiza os detalhes da adoção' do
        @pcare = PetCare.create!(name: 'Júlia', age: 21, email: 'juliarezende@gmail.com')
        @animal = Animal.create!(name: 'Godofreda', sex: 'Fêmea', age: '3', city: 'Concórdia', pet_care: @pcare)

        visit(animals_path)
        click_on('Godofreda')

        expect(page).to have_content('Nome: Godofreda')
        expect(page).to have_content('Sexo: Fêmea')
        expect(page).to have_content('Idade: 3')
        expect(page).to have_content('Cidade: Concórdia')
        expect(page).to have_content('Cuidador: Júlia')

    end

    it 'visualiza os detalhes da adoção e retorna para o menu principal' do

        @pcare = PetCare.create!(name: 'Júlia', age: 21, email: 'juliarezende@gmail.com')
        @animal = Animal.create!(name: 'Godofreda', sex: 'Fêmea', age: '3', city: 'Concórdia', pet_care: @pcare)
        visit(animals_path)
        click_on('Godofreda')
        click_on('Home')

        expect(current_path).to eq(root_path)
        
    end


end