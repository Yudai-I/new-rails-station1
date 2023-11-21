# アプリケーションの基底メーラークラス
class ApplicationMailer < ActionMailer::Base
  # 既定の送信元アドレスを設定
  default from: 'from@example.com'

  # 既定のレイアウトファイルを設定
  layout 'mailer'
end
