class DropPetTtCareTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :pet_cares
  end
end
