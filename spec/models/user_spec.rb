require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmation、名前のseiとmei、名前のsei_kanaとmei_kanaとbirthdayが存在すれば登録できる" do

      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do

      end
      it "emailが空では登録できない" do

      end
      it '重複したemailが存在する場合は登録できない' do

      end
      it 'emailは@を含まないと登録できない' do

      end
      it "passwordが空では登録できない" do

      end
      it 'passwordが5文字以下では登録できない' do

      end
      it 'passwordが129文字以上では登録できない' do

      end
      it 'passwordが半角英数字混合じゃないと登録できない' do

      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do

      end
      it "seiが空では登録できない" do

      end
      it "meiが空では登録できない" do

      end
      it "seiが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do

      end
      it "meiが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do

      end
      it "sei_kanaが空では登録できない" do

      end
      it "mei_kanaが空では登録できない" do

      end
      it "sei_kanaが全角（カタカナ）以外だと登録できない" do

      end
      it "mei_kanaが全角（カタカナ）以外だと登録できない" do

      end
      it "birthdayが空では登録できない" do

      end
    end
  end
end