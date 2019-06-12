class AddKeyDataToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :load_time, :string
    add_column :reports, :ttfb, :string
    add_column :reports, :bytes_out, :string
    add_column :reports, :bytes_out_doc, :string
    add_column :reports, :bytes_in, :string
    add_column :reports, :bytes_in_doc, :string
    add_column :reports, :connections, :string
    add_column :reports, :requests_full, :string
    add_column :reports, :requests_doc, :string
    add_column :reports, :render, :string
    add_column :reports, :fully_loaded, :string
    add_column :reports, :dom_ements, :string
  end
end
