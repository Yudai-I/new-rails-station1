# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_231_105_135_231) do
  create_table 'movies', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', limit: 160, null: false, comment: '映画のタイトル。邦題・洋題は一旦考えなくてOK'
    t.string 'year', limit: 45, comment: '公開年'
    t.text 'description', comment: '映画の説明文'
    t.string 'image_url', limit: 150, comment: '映画のポスター画像が格納されているURL'
    t.boolean 'is_showing', null: false, comment: '上映中かどうか'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['name'], name: 'index_movies_on_name'
  end

  create_table 'reservations', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.date 'date', null: false
    t.integer 'schedule_id', null: false
    t.integer 'sheet_id', null: false
    t.string 'email', null: false
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[date schedule_id sheet_id], name: 'index_reservations_on_date_and_schedule_id_and_sheet_id',
                                           unique: true
  end

  create_table 'schedules', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'movie_id'
    t.date 'schedule_date', null: false
    t.time 'start_time', null: false
    t.time 'end_time', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'screen_id', null: false
    t.index ['screen_id'], name: 'index_schedules_on_screen_id'
  end

  create_table 'screens', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'screen_number', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['screen_number'], name: 'index_screens_on_screen_number', unique: true
  end

  create_table 'sheets', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'column', null: false
    t.string 'row', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'schedules', 'screens'
end
