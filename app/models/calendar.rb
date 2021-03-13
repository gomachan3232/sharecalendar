class Calendar < ApplicationRecord
  has_many :user_calendars
  has_many :users, through: :user_calendars
  has_many :plans

  with_options presence: true do
    validates :name, length: { maximum: 15 }
    validates :user_id
  end
end
