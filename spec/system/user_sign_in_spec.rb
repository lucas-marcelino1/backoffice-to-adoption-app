require 'rails_helper'

describe 'Usuário realiza login' do
    it 'com sucesso' do
        UserPetCare.create!(name: 'Lucas', city: 'Blumenau', email: 'lucas@email.com', password: '123456')

        visit(root_path)
        click_on('Log in')
        within 'form' do 
            fill_in('E-mail', with: 'lucas@email.com')
            fill_in('Senha', with: '123456')
            click_on('Log in')
        end
        expect(page).to have_content('Login efetuado com sucesso.')

    end

    it 'com sucesso e desloga' do
        UserPetCare.create!(name: 'Lucas', city: 'Blumenau', email: 'lucas@email.com', password: '123456')

        visit(root_path)
        click_on('Log in')
        within 'form' do 
            fill_in('E-mail', with: 'lucas@email.com')
            fill_in('Senha', with: '123456')
            click_on('Log in')
        end
        click_on('Sair')

        expect(current_path).to eq(root_path)
        expect(page).not_to have_button('Sair')
        expect(page).to have_link('Log in')

    end
end