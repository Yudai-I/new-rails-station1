# CreateScreensクラスは、映画館のスクリーン（上映室）情報を管理するための`screens`テーブルを作成します。
# 各スクリーンはユニークな番号によって識別されます。
#
# == カラム詳細:
# - screen_number: integer, スクリーンの番号を格納します。NULLを許可しません。
# - timestamps: レコードの作成日時と更新日時を自動記録するためのカラムです。
#
# == インデックス:
# - screen_number: スクリーン番号の一意性を保証するために、ユニークインデックスを追加します。
#
class CreateScreens < ActiveRecord::Migration[6.1]
  def change
    create_table :screens do |t|
      t.integer :screen_number, null: false
      t.references :theater, null: false, foreign_key: true
      t.timestamps
    end
    add_index :screens, [:screen_number, :theater_id], unique: true
  end
end
