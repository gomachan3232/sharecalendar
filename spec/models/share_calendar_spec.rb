require 'rails_helper'

RSpec.describe ShareCalendar, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @calendar = FactoryBot.build(:calendar, user_id: @user.id)
    @calendar.save
    @share_calendar = FactoryBot.build(:share_calendar, user_id: @user.id, calendar_id: @calendar.id)
  end

  describe 'カレンダー共有機能' do
    context 'カレンダー共有できるとき' do
      it 'user_idとcalendar_idがあれば共有できる' do
        expect(@share_calendar).to be_valid
      end
    end

    context 'カレンダー共有できないとき' do
      it 'user_idがないと共有できない' do
        @share_calendar.user_id = ''
        @share_calendar.valid?
        expect(@share_calendar.errors.full_messages).to include('Userを入力してください', 'ユーザーIDが入力されていません。')
      end
      it 'calendar_idがないと共有できない' do
        @share_calendar.calendar_id = ''
        @share_calendar.valid?
        expect(@share_calendar.errors.full_messages).to include('Calendarを入力してください', 'Calendarが入力されていません。')
      end
    end
  end
end
