class AddAnimalToAdoption < ActiveRecord::Migration[7.0]
  def change
    add_reference :adoptions, :animal, null: false, foreign_key: true
  end
end
