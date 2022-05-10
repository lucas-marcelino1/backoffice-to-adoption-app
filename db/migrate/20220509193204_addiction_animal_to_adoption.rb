class AddictionAnimalToAdoption < ActiveRecord::Migration[7.0]
  def change
    add_reference :adoptions, :animal, null: true, foreign_key: true
  end
end
