class AddUserPetCareToAnimal < ActiveRecord::Migration[7.0]
  def change
    add_reference :animals, :user_pet_care, null: false, foreign_key: true, default: 0
  end
end
