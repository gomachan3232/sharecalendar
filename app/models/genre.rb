class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '仕事' },
    { id: 3, name: '遊び' },
    { id: 4, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :schedules
end
