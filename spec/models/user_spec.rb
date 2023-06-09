require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、名前のseiとmei、名前のsei_kanaとmei_kanaとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は無効です。文字と数字を両方含めてください')
      end
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は無効です。文字と数字を両方含めてください')
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = '１２３４５６'
        @user.password_confirmation = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は無効です。文字と数字を両方含めてください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '123edf'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'seiが空では登録できない' do
        @user.sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei can't be blank")
      end
      it 'meiが空では登録できない' do
        @user.mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei can't be blank")
      end
      it 'seiが全角（漢字・ひらがな・カタカナ）以外だと登録できない' do
        @user.sei = 'Marry'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sei は無効です。 全角文字を入力してください')
      end
      it 'meiが全角（漢字・ひらがな・カタカナ）以外だと登録できない' do
        @user.mei = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include('Mei は無効です。 全角文字を入力してください')
      end
      it 'sei_kanaが空では登録できない' do
        @user.sei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Sei kana は無効です。 全角カタカナを入力してください')
      end
      it 'mei_kanaが空では登録できない' do
        @user.mei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Mei kana は無効です。 全角カタカナを入力してください')
      end
      it 'sei_kanaが全角（カタカナ）以外だと登録できない' do
        @user.sei_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sei kana は無効です。 全角カタカナを入力してください')
      end
      it 'mei_kanaが全角（カタカナ）以外だと登録できない' do
        @user.mei_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Mei kana は無効です。 全角カタカナを入力してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
