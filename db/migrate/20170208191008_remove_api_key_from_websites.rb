class RemoveApiKeyFromWebsites < ActiveRecord::Migration[5.0]
  def change
    remove_column :websites, :api_key, :string
  end
end
