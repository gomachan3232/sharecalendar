require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @calendar = FactoryBot.build(:calendar, user_id: @user.id)
    @calendar.save
    @schedule = FactoryBot.build(:schedule, user_id: @user.id, calendar_id: @calendar.id)
  end

  describe 'スケジュール作成' do
    context 'スケジュール作成できるとき' do
      it 'user_idとcalendar_idとdateとschedule_nameとgenre_idがあればスケジュールを作成できる' do
        expect(@schedule).to be_valid
      end
    end
    context 'スケジュール作成できないとき' do
      it 'user_idがないとスケジュールを作成できない' do
        @schedule.user_id = ''
        @schedule.valid?
        expect(@schedule.errors.messages).to include user_id: ['が入力されていません。']
      end
      it 'calendar_idがないとスケジュールを作成できない' do
        @schedule.calendar_id = ''
        @schedule.valid?
        expect(@schedule.errors.messages).to include calendar_id: ['が入力されていません。']
      end
      it 'dateがないとスケジュールを作成できない' do
        @schedule.date = ''
        @schedule.valid?
        expect(@schedule.errors.messages).to include date: ['が入力されていません。']
      end
      it 'schedule_nameがないとスケジュールを作成できない' do
        @schedule.schedule_name = ''
        @schedule.valid?
        expect(@schedule.errors.messages).to include schedule_name: ['が入力されていません。']
      end
      it 'genre_idがないとスケジュールを作成できない' do
        @schedule.genre_id = ''
        @schedule.valid?
        expect(@schedule.errors.messages).to include genre_id: ['が入力されていません。', 'は数値で入力してください']
      end
      it 'genre_idが1(ハイフン)だとスケジュールを作成できない' do
        @schedule.genre_id = 1
        @schedule.valid?
        expect(@schedule.errors.messages).to include genre_id: ['は1以外の値にしてください']
      end
    end
  end
end
