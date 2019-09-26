class CreateCampSites < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_sites, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :name
      t.integer :area_id
      t.integer :prefecture_id
      t.integer :address
      t.integer :category_id
      t.text :introduction

      t.timestamps
    end
  end
end
