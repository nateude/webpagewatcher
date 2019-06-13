class AddKeyDataToReports < ActiveRecord::Migration[5.2]
  change_table :reports, bulk: true do |t|
    t.column :load_time, :string
    t.column :ttfb, :string
    t.column :bytes_out, :string
    t.column :bytes_out_doc, :string
    t.column :bytes_in, :string
    t.column :bytes_in_doc, :string
    t.column :connections, :string
    t.column :requests_full, :string
    t.column :requests_doc, :string
    t.column :render, :string
    t.column :fully_loaded, :string
    t.column :dom_ements, :string
  end
end
