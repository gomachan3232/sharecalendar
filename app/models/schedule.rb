class Schedule < ApplicationRecord
  before_save :set_time_zone

  belongs_to :user
  belongs_to :calendar

  with_options presence: true do
    validates :date
    validates :schedule_name
    validates :genre_id, numericality: { other_than: 1 }
    validates :user_id
    validates :calendar_id
  end

  def set_time_zone
    year = date.year
    month = date.month
    day = date.day

    self.start_time = start_time.change(year: year, month: month, day: day)
    self.end_time = end_time.change(year: year, month: month, day: day)
  end
end
