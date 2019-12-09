class CreateApplicationforms < ActiveRecord::Migration[5.1]
  def change
    create_table :applicationforms do |t|
      t.string :first_name
      t.string :last_name
      t.string :schedule
      t.string :courses

      t.timestamps
    end
  end
end
