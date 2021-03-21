require 'rails_helper'

RSpec.describe Calendar, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @calendar = FactoryBot.build(:calendar, user_id: @user.id)
  end

  describe 'カレンダー作成' do
    context 'カレンダー作成できるとき' do
      it 'user_idとcalendar_nameがあれば作成できる' do
        expect(@calendar).to be_valid
      end
      it 'calendar_nameが15文字以内なら作成できる' do
        @calendar.calendar_name = 'abcdefghijklmno'
        expect(@calendar).to be_valid
      end
    end
    context 'カレンダー作成できないとき' do
      it 'user_idが空だと作成できない' do
        @calendar.user_id = ''
        @calendar.valid?
        expect(@calendar.errors.messages).to include user_id: ['が入力されていません。']
      end
      it 'calendar_nameが16文字以上だと作成できない' do
        @calendar.calendar_name = 'abcdefghijklmnop'
        @calendar.valid?
        expect(@calendar.errors.messages).to include calendar_name: ['は15文字以下に設定して下さい。']
      end
      it 'calendar_nameが空だと作成できない' do
        @calendar.calendar_name = ''
        @calendar.valid?
        expect(@calendar.errors.messages).to include calendar_name: ['が入力されていません。']
      end
    end
  end
end
