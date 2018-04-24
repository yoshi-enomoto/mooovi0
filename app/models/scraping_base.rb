 class Scraping
  def self.movie_urls
    agent = Mechanize.new
    links = []

    # パスの部分を変数で定義(はじめは、空にしておきます)
    next_url = ""

    while true do

      current_page = agent.get("http://review-movie.herokuapp.com/" + next_url)
      elements = current_page.search(".entry-title a")
      elements.each do |ele|
        links << ele.get_attribute('href')
      end

      # 「次へ」を表すタグを取得
      next_link = ???

      # next_linkがなかったらwhile文を抜ける
      unless ???
        ???
      end

      # そのタグからhref属性の値を取得
      next_url = ???


    end

    links.each do |link|
      get_product('http://review-movie.herokuapp.com' + link)
    end
  end
end

