# アプリケーションの基底モデルクラス
# このクラスはActiveRecord::Baseを継承し、全モデルに共通する振る舞いや設定を提供します。
# これは抽象クラスであり、自体はテーブルに対応しないため、単独でインスタンス化されることはありません。
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
