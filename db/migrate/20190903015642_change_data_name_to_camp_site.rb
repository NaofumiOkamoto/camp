class ChangeDataNameToCampSite < ActiveRecord::Migration[5.2]
  def change
    change_column :camp_sites, :name, :string
  end
end
