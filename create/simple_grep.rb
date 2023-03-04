# 本文中に「ホームズ」という単語が何回出てくるか調べる！
# マッチした部分は、<<>>を使って強調。
# 前後の任意の文字数分の文字も合わせて表示。任意の文字数は、ARGV[2]で指定。

# 探したい文字列はARGV[0]に。
pattern = Regexp.new(ARGV[0].encode("UTF-8"))
# 文字列を探したいファイル名はARGV[1]に。
filename = ARGV[1]
# 任意の文字数。コマンドライン引数は文字列型なので、to_iで整数に変換。
len = ARGV[2].to_i

# 回数を初期化。0にしておく。
count = 0

# ファイルを開く。
File.open(filename, "r:UTF-8") do |file|
    file.each_line do |line|
        # パターンとマッチするか？
        if pattern =~ line
            # scanメソッドは、各行において、引数のパターンとマッチした部分文字列の配列を返す。
            line.scan(pattern) do |s|
                # 正規表現でマッチした部分を取り出す変数、$`と$'を使用する。
                pre = "\u3000" * len + $` # \u3000は、全角空白文字はUnicodeのコードポイント。
                post = $'
                puts "#{pre[-len, len]}<<#{s}>>#{post[0, len]}"
                count += 1
            end
            # 文字列置き換えのgsubメソッドにブロックを与えると、マッチした部分を返してくれる。<<>>で囲った文字列に置き換える。
            #print line.gsub(pattern) {|str| "<<#{str}>>"}
        end
    end
end

puts "count: #{count}"