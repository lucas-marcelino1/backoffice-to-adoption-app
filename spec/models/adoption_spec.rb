require 'rails_helper'

RSpec.describe Adoption, type: :model do

  describe 'valid?' do
    it 'Falso quando tenta criar adoção sem passar o animal_id' do

      @adoption = Adoption.create(title: 'Gatinho laranja de 3 meses', description: 'Estou doando este gatinho pois não tenho condições', animal_id: '')
      
      result = @adoption.valid?

      expect(result).to eq(false)

    end

    it 'Falso quando tenta criar adoção com id já cadastrado' do

      @animal = Animal.create(name: 'Tunico', sex: 'Macho', city: 'Blumenau', pet_care: 'Júlia', age: '0.8')
      @adoption = Adoption.create(title: 'Gatinho laranja de 3 meses', description: 'Estou doando este gatinho pois não tenho condições', animal_id: @animal.id)
      @second_adoption = Adoption.create(title: 'Gato alaranjado de 3 meses', description: 'Não tenho condições', animal_id: @animal.id)

      result = @second_adoption.valid?

      expect(result).to eq(false)

    end    
   

  end
end
