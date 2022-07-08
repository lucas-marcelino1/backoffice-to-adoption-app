require 'rails_helper'

describe 'Adoption API' do
  context 'GET api/v1/adoptions' do
    it 'successfuly' do
      UserPetCare.create!(name: 'Lucas', city: 'Blumenau', email: 'lucas@gmail.com', password: '123456')
      Animal.create!(name: 'Roberson', age: 4, user_pet_care: UserPetCare.last, sex: 'Macho', animal_type: 'Capivara', city: 'Blumenau')
      Animal.create!(name: 'Josias', animal_type: 'Gato', age: 3, sex: 'Macho', user_pet_care: UserPetCare.last, city: 'Blumenau')
      Adoption.create!(title: 'Adote a capivara', description: 'Encontrei esta capivara na minha lavação.', animal: Animal.first, user_pet_care: UserPetCare.last)
      Adoption.create!(title: 'Adote um gato', description: 'Gato abandonado', animal: Animal.last, user_pet_care: UserPetCare.last)
      
      get('/api/v1/adoptions')
      
      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response.first['title']).to eq('Adote a capivara')
      expect(json_response.first['description']).to eq('Encontrei esta capivara na minha lavação.')
      expect(json_response.first['animal_type']).to eq('Capivara')
      expect(json_response.first['city']).to eq('Blumenau')
    end
  end

  context 'GET api/v1/adoptions/1' do
    it 'successfuly' do
      UserPetCare.create!(name: 'Lucas', city: 'Blumenau', email: 'lucas@gmail.com', password: '123456')
      Animal.create!(name: 'Josias', animal_type: 'Gato', age: 3, sex: 'Macho', user_pet_care: UserPetCare.last, city: 'Blumenau')
      Adoption.create!(title: 'Adote um gato', description: 'Gato abandonado', animal: Animal.last, user_pet_care: UserPetCare.last)
      
      get('/api/v1/adoptions/1')
      
      expect(response.status).to eq(200)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response['title']).to eq('Adote um gato')
      expect(json_response['description']).to eq('Gato abandonado')
      expect(json_response['user_pet_care']).to eq('Lucas')
      expect(json_response['animal_type']).to eq('Gato')
      expect(json_response['sex']).to eq('Macho')
      expect(json_response['age']).to eq(3.0)
      expect(json_response['city']).to eq('Blumenau')
      expect(json_response['animal_name']).to eq('Josias')
    end
  end
end