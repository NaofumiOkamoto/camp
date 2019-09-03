class Style < ActiveHash::Base
  self.data = [
      {id: 1, style_name: 'みんなでワイワイ'},
      {id: 2, style_name: 'お酒を楽しむ'},
      {id: 3, style_name: 'ソロ'},
      {id: 4, style_name: '焚き火を楽しむ'}
  ]
end
