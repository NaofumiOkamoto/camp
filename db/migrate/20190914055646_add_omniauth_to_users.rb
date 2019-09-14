class AddOmniauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Provider, :string
    add_column :users, :uid, :string
  end
end
