class AddUrlToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :url, :string
  end
end
