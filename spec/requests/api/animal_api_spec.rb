require 'rails_helper'

describe 'Animal API' do
  context 'GET /api/v1/animals/animal_id' do
    it 'success' do
      user = UserPetCare.new(name: 'Lucas', city: 'Blumenau', email: 'lucas@gmail.com', password: '123456')
      animal = Animal.create!(name: 'Josias', animal_type: 'Gato', age: 3, sex: 'Macho', user_pet_care: user, city: 'Blumenau')

      get("/api/v1/animals/#{animal.id}")

      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response["name"]).to eq('Josias')
      expect(json_response["user_pet_care_id"]).to eq(user.id)
      expect(json_response.keys).not_to include('updated_at')
      expect(json_response.keys).not_to include('created_at')

    end

    it 'and fail if animal not found' do
     
      get("/api/v1/animals/114144")

      expect(response.status).to eq 404

    end
  end

  context 'GET /api/v1/animals' do
    it 'success' do 
      @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')
      Animal.create!(name: 'Godofreda', sex: 'Fêmea', age: '3', city: 'Concórdia', animal_type: 'Cachorro', user_pet_care: @user)
      Animal.create!(name: 'Roberta', sex: 'Fêmea', age: '1.7', city: 'Concórdia', animal_type: 'Gato', user_pet_care: @user)
      Animal.create!(name: 'Henrico', sex: 'Macho', age: '2', city: 'Concórdia', animal_type: 'Papagaio', user_pet_care: @user)

      get('/api/v1/animals')

      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 3
      expect(json_response.first["name"]).to eq('Godofreda')
      expect(json_response.first["animal_type"]).to eq('Cachorro')
      expect(json_response.first["user_pet_care_id"]).to eq(@user.id)
      expect(json_response[1]["name"]).to eq('Roberta')
      expect(json_response[1]["animal_type"]).to eq('Gato')
      expect(json_response[1]["user_pet_care_id"]).to eq(@user.id)
      expect(json_response.last["name"]).to eq('Henrico')
      expect(json_response.last["animal_type"]).to eq('Papagaio')
      expect(json_response.last["user_pet_care_id"]).to eq(@user.id)
    end
  end

  context 'POST /api/v1/animals' do
    it 'success' do
      @user = UserPetCare.create!(name: 'Oswaldo', city: 'Blumenau', email: 'oswaldo@gmail.com', password: '123456')

      post('/api/v1/animals', params: {animal: {name: 'Godofreda', sex: 'Fêmea', age: '3', city: 'Concórdia', animal_type: 'Cachorro', user_pet_care_id: @user.id}})

      expect(response.status).to eq 201
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response["name"]).to eq('Godofreda')
      expect(json_response["sex"]).to eq('Fêmea')
    end
  end
end