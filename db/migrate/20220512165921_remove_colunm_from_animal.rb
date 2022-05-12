class RemoveColunmFromAnimal < ActiveRecord::Migration[7.0]
  def change
    remove_column :animals, :pet_care, :string
  end
end
