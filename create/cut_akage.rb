# HTMLファイルからテキストを取り出す

require "cgi/util"

htmlfile = "akage.html"
textfile = "akage.txt"

html = File.read(htmlfile, encoding: "UTF-8")

File.open(textfile, "w:UTF-8") do |f|
    in_header = true
    html.each_line do |line|
        if in_header && /<div class="main_text">/ !~line
            next
        else
            in_header = false
        end
        break if /<div class="after_text">/ =~line

        # gsubメソッドで、第1引数の正規表現に一致する部分全てを、第2引数の文字列で置き換え。
        line.gsub!(/<[^>]+>/, "")
        # CGI.unescapeHTMLメソッドで、&amp;等の文字実体参照を普通の文字列に戻す。
        esc_line = CGI.unescapeHTML(line)
        f.write esc_line
    end
end