class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.integer :applicant_osu_id

      t.timestamps
    end
  end
end
