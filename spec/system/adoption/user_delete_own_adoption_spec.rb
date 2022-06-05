require 'rails_helper'

describe 'Usuário deleta sua própria adoção' do

  it 'com sucesso' do
    @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
    @a = Animal.create!(name: 'Lasanha', sex: 'Macho', age: 3.0, city: 'Blumenau', user_pet_care: @user)

    @adoption = Adoption.create!(title: 'Doa-se gatinho laranja amigável', description: 'Ele é muito carente, gosta de tá perto sempre e é muito fofinho', animal: @a, user_pet_care: @user)

    login_as(@user, :scope => :user_pet_care)
    visit root_path
    click_on('Ver adoção')
    click_on('Cancelar adoção')

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Adoção cancelada com sucesso!')

  end
end