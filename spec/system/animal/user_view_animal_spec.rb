require 'rails_helper'


describe 'Usuário visualiza animal para adoção a partir da tela inicial' do 

    it 'e visualiza os detalhes da adoção' do
        @user = UserPetCare.create!(name: 'Júlia', city: 'Blumenau', email: 'julia@gmail.com', password: '123456')
        @animal = Animal.create!(name: 'Godofreda', sex: 'Fêmea', age: '3', city: 'Concórdia', user_pet_care: @user)

        visit(animals_path)
        click_on('Godofreda')

        expect(page).to have_content('Nome: Godofreda')
        expect(page).to have_content('Sexo: Fêmea')
        expect(page).to have_content('Idade: 3')
        expect(page).to have_content('Cidade: Concórdia')
        expect(page).to have_content('Cuidador: Júlia')

    end

    it 'visualiza os detalhes da adoção e retorna para o menu principal' do

        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
        @animal = Animal.create!(name: 'Godofreda', sex: 'Fêmea', age: '3', city: 'Concórdia', user_pet_care: @user)
        visit(animals_path)
        click_on('Godofreda')
        click_on('Home')

        expect(current_path).to eq(root_path)
        
    end


end