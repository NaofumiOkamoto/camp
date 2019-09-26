class AddCulumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :prefecture_id, :integer
    add_column :users, :style_id, :integer
    add_column :users, :introduction, :text
    add_column :users, :isdeleted, :boolean, default: false
  end
end
