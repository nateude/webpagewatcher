class RemoveWebsiteFromReport < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :website_id, :integer
  end
end
