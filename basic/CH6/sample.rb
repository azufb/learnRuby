# 繰り返し(ループ)

=begin

Rubyにおける、繰り返し処理は、以下の2種類の方法で記述することができる。
・繰り返しの構文を利用する
→for文・while文・until文
・メソッドで実現する
→timesメソッド・eachメソッド・loopメソッド

=end

# timesメソッド
=begin

決められた回数だけ繰り返す場合に使う。
回数.times do
    処理
end

do~endの部分を、「ブロック」という。
「ブロック」は、中括弧でも代用可能。
以下は、「ブロック」を中括弧で代用した場合。
回数.times {
    処理
}



=end

# 「いちめんのなのはな」と7回表示したい
7.times do
    puts('いちめんのなのはな')
end

# for文
=begin

timesメソッドとは異なり、for文はメソッドではなく、構文の1つ。
doは省略可能。
for 変数 in オブジェクト do
    処理
end

=end

# 配列の要素を1つずつ取り出して表示する
names = ['awk', 'Perl', 'Python', 'Ruby']
for name in names do
    puts(name)
end

# 1から5までの数の合計を求める
sum = 0
# 「..」や「...」を使うことで、「範囲オブジェクト」というオブジェクトを作ることができる。
for i in 1..5 do
    sum = sum + i
end
puts(sum)

# while文
=begin

while文もfor文と同じく、メソッドではなく、構文の1種。
条件がtrueになっている間(while)、繰り返される。falseになればループから抜ける。
doは省略可能。
while 条件 do
    処理
end

=end

# 合計値が50より小さい間は加算を繰り返す
sum2 = 0
i2 = 1
while sum2 < 50 do
    sum2 += i2
    i2 += 1
end
puts(sum2)

# until文
=begin

until文もfor文やwhile文と同じく、メソッドではなく、構文の1種。
条件がfalseになっている間、繰り返す。trueになったら、ループを抜ける。
doは省略可能。
until 条件 do
    処理
end

=end

# 合計値が50以上ではない間は加算を繰り返す
=begin
sum3 = 0
i3 = 1
until sum3 >= 50 do
    sum += i3
    i3 += 1
end
=end

# eachメソッド
=begin

eachメソッドは、オブジェクトの要素を取り出すようなときに使われる。
オブジェクト.each do |変数|
    処理
end

do~endは、ブロックなので、中括弧で代用可能。

=end

# 配列から要素を取り出して表示する
nums = [1, 2, 3, 4, 5, 6]
nums.each do |num|
    puts(num)
end

# loopメソッドと繰り返しの制御
=begin

繰り返し処理の途中で、中断・スキップできる命令を加えることができる。
break
→中断して、ループから抜ける。

next
→次の回にスキップ。

redo
→同じ条件でやり直し。ただ、ほとんど使われることはない。


loopメソッド
条件指定がないため、無限ループ状態になるため、上記のような制御命令を加える必要がある。
loop do
    処理
end

=end

# Rubyが10回まで表示する。
# iが10より大きくなったら、breakを使って、ループから抜ける。
i = 1
loop do
    if i > 10 then
        puts('10回を超えたので、ループから抜けます。')
        break
    else
        puts("#{i}回目のRuby!")
        i += 1
    end
end
