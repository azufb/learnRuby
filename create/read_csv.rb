# csvライブラリを使って、csvファイルを読み込む
# 指定した郵便番号のデータをcsvファイルから取得する

require "csv"

code = ARGV[0] # 取り出したい対象の郵便番号をコマンドライン引数で指定
start_time = Time.now # 処理の開始時刻を取得

# csvファイルを開く
CSV.open('data/KEN_ALL.CSV', "r:Shift_JIS:UTF-8") do |csv|
    csv.each do |record|
        # 郵便番号が引数で指定しt郵便番号と一致したら、そのレコードを表示する
        if record[2] == code
            puts record.join(" ")
        end
    end
end

# 処理にかかった時刻を表示
p Time.now - start_time