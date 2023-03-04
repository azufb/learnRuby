# ファイルをダウンロードする

require "open-uri" # http/ftp に簡単にアクセスするためのクラスです。

url = "https://www.aozora.gr.jp/cards/000009/files/8_31220.html"
filename = "akage.html"

# File.openメソッドにブロックを渡すことで、使い終わったファイルを自動的に閉じれるようにしておく。
File.open(filename, "wb:UTF-8") do |f|
    # openメソッドでファイルを開く。
    text = URI.open(url, "r:Shift_JIS:UTF-8").read
    f.write text
end