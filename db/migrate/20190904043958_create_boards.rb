class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.date :date
      t.time :time
      t.string :place
      t.integer :purpos_id
      t.string :detail
      t.string :condition
      t.string :comment
      t.string :camp_id
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
