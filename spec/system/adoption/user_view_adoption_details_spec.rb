require 'rails_helper'

describe 'Usuário visualiza os detalhes da adoção' do

    it 'com sucesso' do
        
        @pcare = PetCare.create!(name: 'Oswaldo', age: '21', email: 'oswaldo@gmail.com')
        @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', pet_care: @pcare)

        @adoption = Adoption.create!(title: 'Doa-se gatinho laranja amigável', description: 'Ele é muito carente, gosta de tá perto sempre e é muito fofinho', animal_id: @a.id)

        visit root_path
        click_on('Ver adoção')

        expect(current_path).to eq(adoption_path(@adoption.id))
        expect(page).to have_content('Visualizando adoção de Lasanha')
    end

end