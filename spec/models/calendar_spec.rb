require 'rails_helper'

RSpec.describe Calendar, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @calendar = FactoryBot.build(:calendar, user_id: @user.id)
  end

  describe 'カレンダー作成' do
    context 'カレンダー作成できるとき' do
      it 'user_idとnameがあれば作成できる' do
        expect(@calendar).to be_valid
      end
      it 'nameが15文字以内なら作成できる' do
        @calendar.name = 'abcdefghijklmno'
        expect(@calendar).to be_valid
      end
    end
    context 'カレンダー作成できないとき' do
      it 'user_idが空だと作成できない' do
        @calendar.user_id = ''
        @calendar.valid?
        expect(@calendar.errors.messages).to include user_id: ['が入力されていません。']
      end
      it 'nameが15文字以上だと作成できない' do
        @calendar.name = 'abcdefghijklmnop'
        @calendar.valid?
        expect(@calendar.errors.messages).to include name: ['は15文字以下に設定して下さい。']
      end
      it 'nameが空だと作成できない' do
        @calendar.name = ''
        @calendar.valid?
        expect(@calendar.errors.messages).to include name: ['が入力されていません。']
      end
    end
  end
end
