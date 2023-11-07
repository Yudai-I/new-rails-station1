# CreateSheetsクラスは、sheetsテーブルを作成するマイグレーションを定義します。
# このテーブルは映画館の各座席の情報を格納するために使用されます。
#
# == カラム詳細:
# - column: integer, 座席の列番号を格納します。NULL値は許可されていません。
# - row: string, 座席の行番号（通常はアルファベット）を格納します。NULL値は許可されていません。
# - timestamps: これにはcreated_atとupdated_atの2つのカラムが含まれ、レコードの作成と最後の更新のタイムスタンプが自動でセットされます。
#
class CreateSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :sheets do |t|
      t.integer :column, null: false  # 座席の列番号
      t.string :row, null: false      # 座席の行番号
      t.timestamps                    # 作成と更新のタイムスタンプ
    end
  end
end
