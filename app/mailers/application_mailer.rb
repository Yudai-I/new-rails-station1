# アプリケーションの基底メーラークラス
# 全てのメーラーはこのクラスを継承することで、共通の設定を利用できます。
class ApplicationMailer < ActionMailer::Base
  # 既定の送信元アドレスを設定
  default from: 'from@example.com'

  # 既定のレイアウトファイルを設定
  layout 'mailer'
end
