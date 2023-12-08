# システムのユーザー情報を管理するモデル。
# Devise gemを使用して認証関連の機能を実装しています。
# 以下のデフォルトモジュールが含まれています:
# :database_authenticatable, :registerable,
# :recoverable, :rememberable, :validatable
# 他の利用可能なモジュールには以下のものがあります:
# :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
class User < ApplicationRecord
  # Deviseの認証機能を設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザー名は必須
  validates :name, presence: true
  # メールアドレスは必須
  validates :email, presence: true
  # パスワードは必須
  validates :password, presence: true
  # パスワード確認も必須
  validates :password_confirmation, presence: true

  has_many :favorites, dependent: :destroy
end
