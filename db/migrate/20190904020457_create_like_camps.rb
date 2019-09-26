class CreateLikeCamps < ActiveRecord::Migration[5.2]
  def change
    create_table :like_camps do |t|
      t.integer :user_id
      t.integer :camp_site_id

      t.timestamps
    end
  end
end
