class CreatePetCares < ActiveRecord::Migration[7.0]
  def change
    create_table :pet_cares do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :adoptions

      t.timestamps
    end
  end
end
