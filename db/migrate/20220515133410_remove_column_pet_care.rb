class RemoveColumnPetCare < ActiveRecord::Migration[7.0]
  def change
    remove_column :animals, :pet_care_id, :integer
  end
end
