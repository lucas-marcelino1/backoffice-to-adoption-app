class AddColumnToPetCare < ActiveRecord::Migration[7.0]
  def change
    add_column :pet_cares, :adoptions, :text, array: true
  end
end
