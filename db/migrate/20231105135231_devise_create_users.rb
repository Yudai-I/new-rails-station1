# DeviseCreateUsersクラスは、Deviseによるユーザー認証機能をサポートする`users`テーブルを作成します。
# このテーブルには、ログインに必要な情報や、パスワードリセット、セッション管理などのためのカラムが含まれます。
#
# == カラム詳細:
# - email: string, ユーザーのメールアドレスを格納します。デフォルト値は空文字列で、NULLを許可しません。
# - encrypted_password: string, ユーザーの暗号化されたパスワードを格納します。デフォルト値は空文字列で、NULLを許可しません。
# - reset_password_token: string, パスワードリセット時に使用するトークンです。
# - reset_password_sent_at: datetime, パスワードリセットのトークンが送信された時刻です。
# - remember_created_at: datetime, ユーザーが「ログイン状態を保持する」機能を使った時の時刻です。
# - name: string, ユーザーの名前を格納します。
# - timestamps: レコードの作成日時と更新日時を自動記録するためのカラムです。NULLを許可しません。
#
# == インデックス:
# - email: メールアドレスの一意性を保証するためにユニークインデックスを追加します。
# - reset_password_token: パスワードリセットトークンの一意性を保証するためにユニークインデックスを追加します。
#
# == 注意:
# このマイグレーションはDeviseのトラッカブル、コンファーマブル、ロッカブルなどの追加モジュール用のコメントアウトされたカラムを含んでいます。
# これらの機能を有効にする場合は、コメントアウトを解除し、必要に応じてマイグレーションを実行してください。
#
class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :name
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
