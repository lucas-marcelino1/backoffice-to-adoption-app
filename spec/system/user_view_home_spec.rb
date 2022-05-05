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

        Animal.create(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', pet_care: 'Oswaldo')

        visit root_path
        expect(page).not_to have_content('Não há adoções disponíveis!')
        expect(page).to have_content('Nome: Lasanha')
        expect(page).to have_content('Sexo: Macho')
        expect(page).to have_content('Idade: 3.0')
        expect(page).to have_content('Cidade: Blumenau')
        expect(page).to have_content('Cuidador: Oswaldo')

    end

    it 'E visualiza não há adoções disponíveis' do 

        visit root_path

        expect(page).to have_content('Não há adoções disponíveis!')

    end

end