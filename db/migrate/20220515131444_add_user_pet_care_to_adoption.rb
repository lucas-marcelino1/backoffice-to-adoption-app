class AddUserPetCareToAdoption < ActiveRecord::Migration[7.0]
  def change
    add_reference :adoptions, :user_pet_care, null: false, foreign_key: true
  end
end
