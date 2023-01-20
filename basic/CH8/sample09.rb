# RubyのホームページのHTMLを取得して、コンソールに出力してみる

require "net/http"
require "uri"

url = URI.parse("https://www.ruby-lang.org/ja/") # parseメソッドを使ってURLの文字列を解析
http = Net::HTTP.new(url.host, url.port) # Net::HTTPオブジェクト作成
http.use_ssl = true
doc = http.get(url.path) # getメソッドを使ってドキュメントを取得
puts(doc.body) # 出力