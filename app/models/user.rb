class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: PASSWORD_REGEX, message: 'は無効です。文字と数字を両方含めてください' }
  with_options presence: true do
    validates :nickname, :birthday
    validates :sei, :mei, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は無効です。 全角文字を入力してください' }
    validates :sei_kana, :mei_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は無効です。 全角カタカナを入力してください' }
  end

  has_many :items
  has_many :orders
end
