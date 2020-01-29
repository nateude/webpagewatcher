class AddUserToWebsite < ActiveRecord::Migration[6.0]
  def change
    add_column :websites, :user_id, :integer
  end
end
