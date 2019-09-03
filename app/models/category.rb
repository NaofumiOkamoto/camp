
class Category < ActiveHash::Base
  self.data = [
      {id: 1, category_name: 'フリーサイト'},
      {id: 2, category_name: '区画サイト'},
      {id: 3, category_name: 'コテージ'},
      {id: 4, category_name: 'グランピング'}
  ]
end
