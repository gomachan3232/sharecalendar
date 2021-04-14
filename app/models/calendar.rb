class Calendar < ApplicationRecord
  has_many :users
  has_many :schedules, dependent: :destroy
  has_many :share_calendars, dependent: :destroy

  with_options presence: true do
    validates :calendar_name, length: { maximum: 15 }
    validates :user_id
  end
end
