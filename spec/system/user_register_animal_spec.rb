require 'rails_helper'

describe 'Usuário acessa a página de cadastro' do 

    it 'a partir da tela inicial' do

        visit(root_path)
        click_on('Cadastrar animal para adoção')

        expect(current_path).to eq(new_animal_path)

    end

    it 'preenche o formulário e cadastra' do

        visit(root_path)
        click_on('Cadastrar animal para adoção')
        fill_in('Nome', with: 'Tunico')
        fill_in('Idade', with: '0.8')
        fill_in('Sexo', with: 'Macho') 
        fill_in('Cidade', with: 'Blumenau') 
        fill_in('Cuidador', with: 'Júlia')
        click_on('Cadastrar animal')
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Animal cadastrado para adoção!')
        expect(page).to have_content('Nome: Tunico')
        expect(page).to have_content('Sexo: Macho')
        expect(page).to have_content('Idade: 0.8')
        expect(page).to have_content('Cidade: Blumenau')
        expect(page).to have_content('Cuidador: Júlia')

    end

    it 'preenche campos de forma inválida' do

        visit(root_path)
        click_on('Cadastrar animal para adoção')
        fill_in('Nome', with: '')
        fill_in('Sexo', with: 'Macho')
        fill_in('Cidade', with: '')
        fill_in('Idade', with: '3')
        fill_in('Cuidador', with: 'Lucas')
        click_on('Cadastrar animal')

        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("City can't be blank")


    end




end