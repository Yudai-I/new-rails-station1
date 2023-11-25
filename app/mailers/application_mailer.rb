# アプリケーションの基底メーラークラス
class ApplicationMailer < ActionMailer::Base
  # 既定の送信元アドレスを設定
  default from: ENV['GMAIL_USERNAME']

  # 既定のレイアウトファイルを設定
  layout 'mailer'
end
