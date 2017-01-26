class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.integer :load_time
      t.integer :first_byte
      t.integer :start_render
      t.integer :speed_index
      t.integer :dom_elements
      t.integer :complete_time
      t.integer :complete_requests
      t.integer :complete_bytes_in
      t.integer :loaded_time
      t.integer :loaded_requests
      t.integer :loaded_bytes_in
      t.integer :loaded_certificates

      t.timestamps
    end
  end
end
