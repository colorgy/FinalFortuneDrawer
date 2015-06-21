class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_url, :string
    add_column :users, :name, :string
    add_column :users, :organization_name, :string
    add_column :users, :organization_short_name, :string
    add_column :users, :fbid, :string
    add_column :users, :fbtoken, :string
    add_column :users, :refreshed_at, :datetime
  end
end
