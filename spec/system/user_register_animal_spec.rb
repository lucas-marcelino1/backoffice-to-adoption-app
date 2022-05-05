require 'rails_helper'

describe 'Usuário acessa a página de cadastro' do 

    it 'a partir da tela inicial' do

        visit(root_path)
        click_on('Cadastrar animal para adoção')

        expect(current_path).to eq(new_animal_path)

    end


end