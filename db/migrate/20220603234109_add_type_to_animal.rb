class AddTypeToAnimal < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :animal_type, :string
  end
end
