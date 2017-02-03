class AddStatusCodeToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :status_code, :integer
  end
end
