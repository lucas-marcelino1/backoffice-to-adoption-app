require 'rails_helper'

describe 'Usuário se cadastra' do

    it 'com sucesso' do
        visit(root_path)
        click_on('Entrar')
        click_on('Cadastrar nova conta')
        fill_in('Nome', with: 'Nova Conta')
        fill_in('Cidade', with: 'Contaville')
        fill_in('E-mail', with: 'novaconta@gmail.com')
        fill_in('Senha', with: '123456')
        fill_in('Confirme sua senha', with: '123456')
        click_on('Cadastrar nova conta')

        expect(page).to have_content('Boas vindas! Você realizou seu registro com sucesso.')

    end
end