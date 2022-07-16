class AddAdoptedToAnimal < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :adopted, :boolean, default: false
  end
end
