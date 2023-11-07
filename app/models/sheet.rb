# 映画館の座席を表すモデル。
# 各座席は複数の予約（Reservation）を持つことが可能です。
# 座席が削除された場合、それに紐づく予約も同時に削除されます。
class Sheet < ApplicationRecord
  # Reservationモデルへの関連付けで、座席が削除された際に関連する予約も削除される
  has_many :reservations, dependent: :destroy
end
