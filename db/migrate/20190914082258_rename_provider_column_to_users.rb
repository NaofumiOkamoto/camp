class RenameProviderColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :Provider, :provider
  end
end
