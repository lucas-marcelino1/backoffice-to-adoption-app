require 'rails_helper'

describe 'Usuário acessa o registro de adoções' do

    it 'a partir da tela inicial' do
        visit(root_path)
        click_on('Realizar adoção de animal')

        expect(page).to have_field('Título')
        expect(page).to have_field('Descrição')
        expect(page).to have_field('Animal')
    end

    it 'e cadastra adoção com sucesso' do

        @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', pet_care: 'Oswaldo')

        visit(root_path)
        click_on('Realizar adoção de animal')
        fill_in('Título', with: 'Doa-se gatinho laranja')
        fill_in('Descrição', with: 'Ele é muito carente e adora estar perto')
        select('Lasanha', from: 'Animal')
        click_on('Cadastrar adoção')

        expect(current_path).to eq(root_path)
        expect(page).to have_content('Adoção cadastrada com sucesso')
        expect(page).to have_content('Doa-se gatinho laranja')
        expect(page).to have_content('Nome: Lasanha')
        
    end


    it 'e falha ao cadastrar adoção com campos inválidos' do

        @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', pet_care: 'Oswaldo')

        visit(root_path)
        click_on('Realizar adoção de animal')
        fill_in('Título', with: '')
        fill_in('Descrição', with: 'Ele é muito carente e adora estar perto')
        select('Lasanha', from: 'Animal')
        click_on('Cadastrar adoção')

        expect(page).to have_content('Adoção falhou!')
        expect(page).to have_field('Título', with: '')
        expect(page).to have_field('Descrição', with: 'Ele é muito carente e adora estar perto')
        
    end

end