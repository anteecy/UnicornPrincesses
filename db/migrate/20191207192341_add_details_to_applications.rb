class AddDetailsToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :lecture_section, :integer
    add_column :applications, :lab_section, :integer
    add_column :applications, :recommandations_id, :integer
    add_column :applications, :osu_id, :integer
  end
end
