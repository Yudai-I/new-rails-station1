# 顧客用の映画館内の座席情報のコントローラ
class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
  end
end
