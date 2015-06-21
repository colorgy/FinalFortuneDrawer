class AddDrawerKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :drawer_key, :string
  end
end
