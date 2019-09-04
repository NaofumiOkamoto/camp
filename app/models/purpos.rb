class Purpos < ActiveHash::Base
  self.data = [
      {id: 1, purpos_name: '一緒に飲もう'},
      {id: 2, purpos_name: '子どもたち集まろう'},
      {id: 3, purpos_name: 'キャンプ教えて・手伝って'},
      {id: 4, purpos_name: '道具売りたい・買いたい'},
      {id: 5, purpos_name: 'その他'}
  ]
end
