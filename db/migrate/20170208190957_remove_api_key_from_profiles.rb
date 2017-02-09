class RemoveApiKeyFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :api_key, :string
  end
end
