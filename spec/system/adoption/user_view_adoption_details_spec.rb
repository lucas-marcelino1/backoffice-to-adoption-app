require 'rails_helper'

describe 'Usuário visualiza os detalhes da adoção' do

    it 'com sucesso' do
        
        @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
        @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', user_pet_care: @user)

        @adoption = Adoption.create!(title: 'Doa-se gatinho laranja amigável', description: 'Ele é muito carente, gosta de tá perto sempre e é muito fofinho', animal: @a, user_pet_care: @user)

        login_as(@user, :scope => :user_pet_care)
        visit root_path
        click_on('Minhas adoções')
        click_on('Doa-se gatinho laranja amigável')

        expect(current_path).to eq(adoption_path(@adoption.id))
        expect(page).to have_content('Visualizando adoção de Lasanha')
        expect(page).to have_content('Doa-se gatinho laranja amigável')
        expect(page).to have_content('Ele é muito carente, gosta de tá perto sempre e é muito fofinho')
        expect(page).to have_content('Nome: Lasanha')
        expect(page).to have_content('Macho')
        expect(page).to have_content('3.0 anos')
        expect(page).to have_content('Cuidador: Oswaldo < oswaldo@gmail.com > - Blumenau')


    end

end