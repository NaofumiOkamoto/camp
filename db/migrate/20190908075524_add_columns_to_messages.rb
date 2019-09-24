class AddColumnsToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :camp_site, foreign_key: true
  end
end
