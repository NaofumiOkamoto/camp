
class Category < ActiveHash::Base
  self.data = [
      {id: 1, category: 'フリーサイト'},
      {id: 2, category: '区画サイト'},
      {id: 3, category: 'コテージ'},
      {id: 4, category: 'グランピング'},
  ]
end
