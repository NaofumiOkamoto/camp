class ChangeDataAddressToCampSite < ActiveRecord::Migration[5.2]
  def change
    change_column :camp_sites, :address, :string
  end
end
