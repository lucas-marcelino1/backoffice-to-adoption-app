class AddPetCareToAnimal < ActiveRecord::Migration[7.0]
  def change
    add_reference :animals, :pet_care, null: false, foreign_key: true, default: 0
  end
end
