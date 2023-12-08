# CreateMovieクラスは`movies`テーブルを作成するためのマイグレーションを定義します。
# このテーブルは映画の基本情報を管理することを目的としています。
#
# == カラム詳細:
# - name: string, 映画のタイトルを格納します。最大160文字までで、NULLは許可しません。インデックスが追加され、検索性を向上させます。
# - year: string, 映画の公開年を格納します。最大45文字まで。
# - description: text, 映画の説明文を格納します。
# - image_url: string, 映画のポスター画像のURLを格納します。最大150文字まで。
# - is_showing: boolean, 映画が現在上映中かどうかの状態を格納します。NULLは許可しません。
# - timestamps: レコードの作成日時と更新日時を自動記録するためのカラムです。
#
class CreateMovie < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name, limit: 160, null: false, index: true, comment: '映画のタイトル。邦題・洋題は一旦考えなくてOK'
      t.string :genre, null: false
      t.string :year, limit: 45, comment: '公開年'
      t.text :description, comment: '映画の説明文'
      t.string :image_url, limit: 150, comment: '映画のポスター画像が格納されているURL'
      t.boolean :is_showing, null: false, comment: '上映中かどうか'

      t.timestamps
    end
  end
end
