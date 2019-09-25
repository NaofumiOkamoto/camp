class CreateLikeBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :like_boards, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
  end
end
