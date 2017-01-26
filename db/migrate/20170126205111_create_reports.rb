class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :website_id
      t.integer :profile_id
      t.string :wpt_id
      t.string :status
      t.string :data

      t.timestamps
    end
  end
end
