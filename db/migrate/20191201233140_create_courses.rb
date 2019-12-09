class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :course_number
      t.integer :section_number
      t.integer :start_time
      t.integer :end_time
      t.string  :days
      t.boolean :is_offered

      t.timestamps
    end
  end
end
