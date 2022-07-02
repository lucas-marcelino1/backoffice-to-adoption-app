require 'rails_helper'

describe 'Usuário acessa a tela inicial' do 

    it 'E visualiza Me adota - Cadastro de animais para adoção online' do

        #Arrange

        #Act
        visit(root_path)

        #Assert
        expect(page).to have_content("Me adota - Cadastro de animais para adoção online")

    end

    it 'E visualiza todas as ações e links disponíveis' do 
        @user = UserPetCare.create!(name: 'Júlia', city: 'Blumenau', email: 'julia@gmail.com', password: '123456')
    
        login_as(@user, :scope => :user_pet_care)
        visit root_path
        expect(page).to have_content('Minhas adoções')
        expect(page).to have_content('Meus animais cadastrados')
        expect(page).to have_content('Realizar cadastro de animal')
        expect(page).to have_content('Cadastrar animal para adoção')

    end

end