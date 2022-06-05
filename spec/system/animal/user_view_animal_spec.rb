require 'rails_helper'


describe 'Usuário visualiza seus animais cadastrados na plataforma' do 

    it 'e visualiza os detalhes do animal' do
        @user = UserPetCare.create!(name: 'Júlia', city: 'Blumenau', email: 'julia@gmail.com', password: '123456')
        @animal = Animal.create!(name: 'Godofreda', sex: 'Fêmea', age: '3', city: 'Concórdia', animal_type: 'Gato', user_pet_care: @user)

        login_as(@user)
        visit(root_path)
        click_on('Meus animais cadastrados')
        click_on('Godofreda')

        expect(page).to have_content('Nome: Godofreda')
        expect(page).to have_content('Sexo: Fêmea')
        expect(page).to have_content('Idade: 3')
        expect(page).to have_content('Tipo de animal: Gato')
        expect(page).to have_content('Cidade: Concórdia')
        expect(page).to have_content('Cuidador: Júlia')

    end

    it 'todos os animais' do

        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
        @animal = Animal.create!(name: 'Godofreda', sex: 'Fêmea', age: '3', city: 'Concórdia', animal_type: 'Cachorro', user_pet_care: @user)
        @animal = Animal.create!(name: 'Roberta', sex: 'Fêmea', age: '1.7', city: 'Concórdia', animal_type: 'Gato', user_pet_care: @user)
        @animal = Animal.create!(name: 'Henrico', sex: 'Macho', age: '2', city: 'Concórdia', animal_type: 'Papagaio', user_pet_care: @user)
        login_as(@user)
        visit(root_path)
        click_on('Meus animais cadastrados')

        expect(current_path).to eq(animals_path)
        expect(page).to have_content('Godofreda - Cachorro')
        expect(page).to have_content('Roberta - Gato')
        expect(page).to have_content('Henrico - Papagaio')

        
    end


end