class CreateAdoptions < ActiveRecord::Migration[7.0]
  def change
    create_table :adoptions do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
