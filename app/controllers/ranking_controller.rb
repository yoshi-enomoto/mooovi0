class RankingController < ApplicationController
  layout 'mooovi'
  #『layout』で記載することで、
  #  そのコントローラでのアクションが呼ばれたあと表示するビューの
  #  レイアウトファイルを指定できる。
  #『application.html.haml』の設定を上書きし、『mooovi.html.haml』を適用可能。
  before_action :ranking
  def ranking
  end
end
