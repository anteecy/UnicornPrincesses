class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.integer :course_number
      t.integer :section_number
      t.string :day
      t.string :time
      t.string :teacher
      t.boolean :has_lab

      t.timestamps
    end
  end
end
