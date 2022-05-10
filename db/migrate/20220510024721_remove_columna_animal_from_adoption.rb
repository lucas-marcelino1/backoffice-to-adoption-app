class RemoveColumnaAnimalFromAdoption < ActiveRecord::Migration[7.0]
  def change
    remove_reference :adoptions, :animal, null: false, foreign_key: true
  end
end
