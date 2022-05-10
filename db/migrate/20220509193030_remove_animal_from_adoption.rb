class RemoveAnimalFromAdoption < ActiveRecord::Migration[7.0]
  def change
    remove_column :adoptions, :animal_id, :string
  end
end
