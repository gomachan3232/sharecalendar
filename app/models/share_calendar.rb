class ShareCalendar < ApplicationRecord
  belongs_to :user
  belongs_to :calendar

  with_options presence: true do
    validates :user_id
    validates :calendar_id
  end
end
