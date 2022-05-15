require 'rails_helper'

describe 'Usuário edita o animal cadastrado para adoção' do

    it 'a partir da página de caracteristicas' do

        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
        @a = Animal.create!(name: 'Pecúnia', sex: 'Macho', age: 2.0, city: 'Blumenau', user_pet_care: @user)

        visit(animals_path)
        click_on('Pecúnia')
        click_on('Editar adoção')

        expect(current_path).to eq(edit_animal_path(@a.id))
        expect(page).to have_field('Nome', with: 'Pecúnia')
        expect(page).to have_field('Sexo', with: 'Macho')
        expect(page).to have_field('Idade', with: '2.0')
        expect(page).to have_field('Cidade', with: 'Blumenau')
        
    end

    it 'com sucesso' do
        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
        @a = Animal.create!(name: 'Pecúnia', sex: 'Macho', age: 2.0, city: 'Blumenau', user_pet_care: @user)

        visit(animals_path)
        click_on('Pecúnia')
        click_on('Editar adoção')
        fill_in('Nome', with: 'Dona Pecúnia')
        fill_in('Sexo', with: 'Fêmea')
        fill_in('Cidade', with: 'Curitibanos')
        click_on('Editar adoção')

        expect(current_path).to eq(animal_path(@a.id))
        expect(page).to have_content('Nome: Dona Pecúnia')
        expect(page).to have_content('Sexo: Fêmea')
        expect(page).to have_content('Cidade: Curitibanos')
        expect(page).to have_content('Idade: 2.0')
       

    end

    it 'com campos inválidos' do

        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
        @a = Animal.create!(name: 'Pecúnia', sex: 'Macho', age: 2.0, city: 'Blumenau', user_pet_care: @user)

        visit(animals_path)
        click_on('Pecúnia')
        click_on('Editar adoção')
        fill_in('Nome', with: '')
        fill_in('Sexo', with: 'Fêmea')
        fill_in('Cidade', with: '')
        click_on('Editar adoção')


        expect(page).to have_content('Não foi possível realizar a edição')
        expect(page).to have_field('Nome', with: '')
        expect(page).to have_field('Sexo', with: 'Fêmea')
        expect(page).to have_field('Cidade', with: '')
        expect(page).to have_field('Idade', with: '2.0')
        
    end
end