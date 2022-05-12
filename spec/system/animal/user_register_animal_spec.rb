require 'rails_helper'

describe 'Usuário acessa a página de cadastro' do 

    it 'a partir da tela inicial' do

        visit(root_path)
        click_on('Realizar cadastro de animal')

        expect(current_path).to eq(new_animal_path)

    end

    it 'preenche o formulário e cadastra' do
        @pcare = PetCare.create!(name: 'Oswaldo', age: '21', email: 'oswaldo@gmail.com')

        visit(root_path)
        click_on('Realizar cadastro de animal')
        fill_in('Nome', with: 'Tunico')
        fill_in('Idade', with: '0.8')
        fill_in('Sexo', with: 'Macho') 
        fill_in('Cidade', with: 'Blumenau') 
        select('Oswaldo', from: 'Cuidador')
        click_on('Cadastrar animal')
        
        expect(current_path).to eq(animals_path)
        expect(page).to have_content('Animal cadastrado com sucesso!')
        expect(page).to have_content('Nome: Tunico')
        expect(page).to have_content('Cuidador: Oswaldo')
      

    end

    it 'preenche campos de forma inválida' do
        @pcare = PetCare.create!(name: 'Oswaldo', age: '21', email: 'oswaldo@gmail.com')

        visit(root_path)
        click_on('Realizar cadastro de animal')
        fill_in('Nome', with: '')
        fill_in('Sexo', with: 'Macho')
        fill_in('Cidade', with: '')
        fill_in('Idade', with: '3')
        select('Oswaldo', from: 'Cuidador')
        click_on('Cadastrar animal')

        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("City can't be blank")


    end




end