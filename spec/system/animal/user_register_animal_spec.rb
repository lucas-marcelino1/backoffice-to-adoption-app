require 'rails_helper'

describe 'Usuário acessa a página de cadastro de animal', js: true do 

    it 'a partir da tela inicial' do
        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')

        login_as(@user)
        visit(root_path)
        click_on('Realizar cadastro de animal')

        expect(current_path).to eq(new_animal_path)

    end

    it 'preenche o formulário e cadastra' do
        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')

        login_as(@user, :scope => :user_pet_care)
        visit(root_path)
        click_on('Realizar cadastro de animal')
        fill_in('Nome', with: 'Tunico')
        fill_in('Tipo de animal', with: 'Gato')
        fill_in('Idade', with: '0.8')
        fill_in('Cidade', with: 'Blumenau') 
        click_on('Cadastrar animal')
        
        expect(current_path).to eq(animals_path)
        expect(page).to have_content('Animal cadastrado com sucesso!')
        expect(page).to have_content('Tunico - Gato')
      

    end

    it 'preenche campos de forma inválida' do
        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')

        login_as(@user, :scope => :user_pet_care)
        visit(root_path)
        click_on('Realizar cadastro de animal')
        fill_in('Nome', with: '')
        find('label', text: 'Macho').click
        fill_in('Cidade', with: '')
        fill_in('Idade', with: '3')
        click_on('Cadastrar animal')

        expect(page).to have_content("Nome não pode ficar em branco")
        expect(page).to have_content("Cidade não pode ficar em branco")


    end




end