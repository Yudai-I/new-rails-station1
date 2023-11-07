require_relative 'boot'

require 'rails/all'

# Gemfileに記載されたgemをrequireします。
# :test, :development, :productionで指定されたgemも含む。
Bundler.require(*Rails.groups)

# アプリケーションのメインモジュール。
# このモジュール内でRailsアプリケーションの基本設定を行います。
module App
  # App::Applicationクラス
  #
  # このクラスはRailsアプリケーションの全体的な設定を含む基盤となります。
  # config/ディレクトリ内のファイルによってカスタマイズされる様々な設定を
  # デフォルトで初期化し、アプリケーション固有の設定を追加できるようにします。
  class Application < Rails::Application
    # 元々生成されたRailsのバージョンでデフォルトの設定を初期化。
    config.load_defaults 6.1

    # RSpecに関する設定：不要なテストファイルが生成されないようにする。
    config.generators do |g|
      g.test_framework false
    end

    # アプリケーション、エンジン、およびrailtiesの設定はここに書きます。
    # これらの設定は特定の環境でconfig/environments内のファイルを通じて
    # 上書きすることができます。これらのファイルは後で処理されます。

    # 例の設定：
    # config.time_zone = 'Central Time (US & Canada)'
    # config.eager_load_paths << Rails.root.join('extras')
  end
end
