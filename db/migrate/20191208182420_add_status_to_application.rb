class AddStatusToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :status, :integer, :default => 0
  end
end
