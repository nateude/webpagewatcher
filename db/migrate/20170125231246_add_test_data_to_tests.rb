class AddTestDataToTests < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :status, :string
    add_column :tests, :wpt_id, :string
    add_column :tests, :url, :string
  end
end
