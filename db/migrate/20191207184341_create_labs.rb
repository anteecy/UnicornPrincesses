class CreateLabs < ActiveRecord::Migration[5.1]
  def change
    create_table :labs do |t|
      t.integer :parent_section_number
      t.integer :section_number
      t.string :days
      t.string :time

      t.timestamps
    end
  end
end
