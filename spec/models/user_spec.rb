require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが10文字以内なら登録できる' do
        @user.nickname = 'abcdefghij'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上なら登録できる' do
        @user.password = 'abcdef1'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混同なら登録できる' do
        @user.password = 'testtest1'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致していれば登録できる' do
        @user.password = 'abcdef1'
        @user.password_confirmation = 'abcdef1'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.messages).to include nickname: ['が入力されていません。']
      end
      it 'nicknameが10文字以上だと登録できない' do
        @user.nickname = 'abcdefghijk'
        @user.valid?
        expect(@user.errors.messages).to include nickname: ['は10文字以下に設定して下さい。']
      end
      it 'nicknameが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.valid?
        expect(another_user.errors.messages).to include nickname: ['は既に使用されています。']
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.messages).to include email: ['が入力されていません。']
      end
      it 'emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.messages).to include email: ['は既に使用されています。']
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.messages).to include password: %w[が入力されていません。 は有効でありません。], password_confirmation: ['が内容とあっていません。']
      end
      it 'passwordが半角文字だけだと登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.messages).to include password: ['は有効でありません。'], password_confirmation: ['が内容とあっていません。']
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.messages).to include password: ['は有効でありません。'], password_confirmation: ['が内容とあっていません。']
      end
      it 'passwordに全角文字が入っていると登録できない' do
        @user.password = 'あbcabc1'
        @user.valid?
        expect(@user.errors.messages).to include password: ['は有効でありません。'], password_confirmation: ['が内容とあっていません。']
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.messages).to include password_confirmation: ['が内容とあっていません。']
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = 'abcdef1'
        @user.password_confirmation = 'abcdef12'
        @user.valid?
        expect(@user.errors.messages).to include password_confirmation: ['が内容とあっていません。']
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.messages).to include birthday: ['が入力されていません。']
      end
    end
  end
end
