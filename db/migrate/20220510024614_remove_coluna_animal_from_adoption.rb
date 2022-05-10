class RemoveColunaAnimalFromAdoption < ActiveRecord::Migration[7.0]
  def change
    remove_column :adoptions, :animal, :string
  end
end
