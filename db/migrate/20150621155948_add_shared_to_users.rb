class AddSharedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shared, :boolean, null: false, default: false
  end
end
