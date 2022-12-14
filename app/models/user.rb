class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  # 存在すること・確認用を含めて2回入力・6字以上はdeviseのデフォルト実装のため省略

  # 半角英数字（空文字NG）以外の場合には、メッセージを出す
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  validates :nickname, presence: true

  # 全角ひらがな、全角カタカナ、漢字で入力必須
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }

  # 全角カタカナで入力必須
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
