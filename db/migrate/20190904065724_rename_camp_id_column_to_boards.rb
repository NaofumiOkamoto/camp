class RenameCampIdColumnToBoards < ActiveRecord::Migration[5.2]
  def change
    rename_column :boards, :camp_id, :camp_site_id
  end
end
