require 'rails_helper'

describe 'Usuário acessa a tela inicial' do 

    it 'E visualiza Adoção de animais online' do

        #Arrange

        #Act
        visit(root_path)

        #Assert
        expect(page).to have_content("Adoção de animais online")

    end

    it 'E visualiza todas as adoções de animais disponíveis' do 
        @user = UserPetCare.create!(name: 'Júlia', city: 'Blumenau', email: 'julia@gmail.com', password: '123456')
        @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', user_pet_care: @user)
        @adoption = Adoption.create!(title: 'Doa-se gatinho laranja amigável', description: 'Ele é muito carente, gosta de tá perto sempre e é muito fofinho', animal: @a, user_pet_care: @user )

        visit root_path
        expect(page).not_to have_content('Não há adoções disponíveis!')
        expect(page).to have_content('Doa-se gatinho laranja amigável')
        expect(page).to have_content('Lasanha')


    end

    it 'E visualiza a mensagem não há adoções disponíveis' do 

        visit root_path

        expect(page).to have_content('Não há adoções disponíveis!')

    end

   


end