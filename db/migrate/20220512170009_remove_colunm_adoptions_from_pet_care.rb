class RemoveColunmAdoptionsFromPetCare < ActiveRecord::Migration[7.0]
  def change
    remove_column :pet_cares, :adoptions, :string
  end
end
