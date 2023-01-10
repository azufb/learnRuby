# メソッド

=begin

オブジェクトに定義されていて、そのオブジェクトに関する操作を行うために使う。

呼び出し方
オブジェクト.メソッド名(引数)
上記のオブジェクトは、レシーバとも呼ばれる。
オブジェクト指向においてメソッドを実行することは、「オブジェクトに引数とメッセージを送る」こととなり、
それらを受け取るのがオブジェクトになるから。

eachメソッドやloopメソッド、timesメソッドのような、「ブロック付きメソッド」がある。
do~endがブロックで、中括弧で代替可能。

=end

# インスタンスメソッド
=begin

一般的なメソッド。オブジェクト(インスタンス)をレシーバとするメソッド。
splitメソッドやindexメソッド、to_sメソッドなどがある。
オブジェクトのクラスによって、使えるインスタンスメソッドは異なる。

=end

p("10,20,30,40".split(","))
puts([1, 2, 3, 4].index(2))
p(1000.to_s)

# クラスメソッド
=begin

レシーバをクラスとし、クラスに対して操作を行うメソッド。
クラスのインスタンスを作成したり、関連操作を行う。

=end
# 新しい配列を作る(配列クラスのインスタンスを作成)
Array.new

# 新しいTimeオブジェクトを作る(Timeクラスのインスタンスを作成)
puts(Time.now)

# 関数的メソッド
=begin

レシーバがないメソッド。ないというよりは省略されている。

=end

print("hello!\n")

# メソッドの定義
=begin

メソッドは以下のように定義する。
def メソッド名(引数)
    実行したい処理
end

インスタンスメソッドやクラスインスタンスは、先にクラスを作る必要がある。

=end

# 引数にデフォルト値を設定することも可能。
def hello(name='NANASHI')
    puts("Hello, #{name}.")
end

hello("Azu")

# return文を使って、戻り値を指定できる。
def welcomeMessage(name='NANASHI')
    return "Welcome #{name}!"
end

message = welcomeMessage("Azu")
puts(message)

# 引数の数が不定なメソッド
=begin

引数がいくつ渡ってくるかわからない場合でも、*変数名として記述すれば、
メソッド呼び出し時に、複数の引数を渡せる。

=end

def message(*names)
    names.each do |name|
        puts("#{name}さん、お疲れ様です。")
    end
end

message("Ruby")
message("Java", "JavaScript", "TypeScript", "PHP")

# キーワード引数
=begin

キーワード引数を使って、引数名と値をセットにして、メソッドに渡せる。
メソッドを定義する際に、デフォルト値の設定が必要になる。
def メソッド名(引数1: デフォルト値, 引数2: デフォルト値)
    実行したい処理
end

ハッシュオブジェクトの形で、引数に渡しても良い。
シンボルを引数名と同じものにする。

=end

# 直方体の表面積を求めてみる
def area(x: 0, y: 0, z: 0)
    xy = x * y
    yz = y * z
    zx = z * x
    
    return (xy + yz + zx) * 2
end

puts(area(x: 2, y: 3, z: 4))