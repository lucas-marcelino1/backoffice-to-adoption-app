class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :sex
      t.float :age
      t.string :city
      t.string :pet_care

      t.timestamps
    end
  end
end
