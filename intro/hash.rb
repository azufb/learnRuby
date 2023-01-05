# ハッシュ
# 通常のキーの場合
song = {:title => 'Peranoid Android', :artist => 'Radiohead'}

# シンボルをキーにする場合
song = {title: 'Peranoid Android', artist: 'Radiohead'}

address = {name: '高橋', furigana: 'たかはし'}
puts("名前は、#{address[:name]}だよ。")

# ハッシュにオブジェクトを追加
address[:tel] = '000-1234-5678'
puts("#{address[:tel]}にコールミー！！")