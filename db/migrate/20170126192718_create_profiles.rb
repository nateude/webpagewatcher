class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :website_id
      t.string :wpt_settings
      t.string :wpt_code
      t.integer :interval
      t.string :api_key

      t.timestamps
    end
  end
end
