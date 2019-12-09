class RenameApplicationsToGraderApplications < ActiveRecord::Migration[5.1]
  def change
    rename_table :applications, :grader_applications
  end
end
