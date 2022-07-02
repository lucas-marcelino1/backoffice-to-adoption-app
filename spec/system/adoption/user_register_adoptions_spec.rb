require 'rails_helper'

describe 'Usuário acessa o registro de adoções' do

    it 'a partir da tela inicial' do
        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')

        login_as(@user, :scope => :user_pet_care)
        visit(root_path)
        click_on('Cadastrar animal para adoção')

        expect(page).to have_field('Título')
        expect(page).to have_field('Descrição')
        expect(page).to have_field('Animal')
    end

    it 'e cadastra adoção com sucesso' do

        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
        @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', user_pet_care: @user)

        login_as(@user, :scope => :user_pet_care)
        visit(root_path)
        click_on('Cadastrar animal para adoção')
        fill_in('Título', with: 'Doa-se gatinho laranja')
        fill_in('Descrição', with: 'Ele é muito carente e adora estar perto')
        select('Lasanha', from: 'Animal')
        click_on('Cadastrar adoção')

        expect(current_path).to eq(adoptions_path)
        expect(page).to have_content('Adoção cadastrada com sucesso')
        expect(page).to have_content('Doa-se gatinho laranja')
        expect(page).to have_content('Nome: Lasanha')
        
    end


    it 'e falha ao cadastrar adoção com campos inválidos' do

        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
        @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', user_pet_care: @user, animal_type: 'Gato')

        login_as(@user, :scope => :user_pet_care)
        visit(root_path)
        click_on('Cadastrar animal para adoção')
        fill_in('Título', with: '')
        fill_in('Descrição', with: 'Ele é muito carente e adora estar perto')
        select('Lasanha', from: 'Animal')
        click_on('Cadastrar adoção')

        expect(page).to have_content('Adoção falhou!')
        expect(page).to have_field('Título', with: '')
        expect(page).to have_field('Descrição', with: 'Ele é muito carente e adora estar perto')
        
    end

end