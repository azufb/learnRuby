require_relative "jzipcode"

start_time = Time.now # 処理開始の現在時刻取得
db = File.join(__dir__, "data/jzipcode.db")
csv = File.join(__dir__, "data/KEN_ALL.CSV")
jzipcode = JZipCode.new(db)
jzipcode.create(csv)

keyword = ARGV[0]
result = jzipcode.find_by_code(keyword)
if result.empty?
    result = jzipcode.find_by_address(keyword)
end
puts result
puts
# 処理にかかった時刻を表示
puts "#{Time.now - start_time}秒"