# ブロック
# 例えば、eachメソッドのdo~endの部分。

# 繰り返しにおけるブロック
alphabet = ["a", "b", "c", "d", "e"]
# do~endまでがブロック。alpはブロック変数。配列の各要素を代入。
alphabet.each do |alp|
    puts(alp.upcase)
end

# each_with_indexは、ブロック変数として、各要素とインデックス番号の2つを渡す。
alphabet.each_with_index do |alp, index|
    puts("#{alp}-#{index}")
end

# 計算の一部差し替え
=begin

条件に合わせた処理が必要なメソッドの場合、それぞれに合ったメソッドを用意すると数が多くなる。
このような場合、メソッドを呼び出すときに、ブロックで条件を指定することができる。
例えば、sortメソッドやsort_byメソッドが代表的。
    
=end

# 例）sortメソッド
# ブロックを渡さない。(デフォルトの、大小比較<=>を行なった結果が返される。)
sampleArray = [10, 3, 7, 5, 9, 1, 4, 20]
p(sampleArray.sort) # [1, 3, 4, 5, 7, 9, 10, 20]

# ブロックを渡す。大きい順にソートしたい。
# <=>演算子は小さい順になるため、演算子の左右の値を入れ替えることで大きい順にできる。
p(sampleArray.sort {|a, b| b <=> a})

# ブロックをオブジェクトとして受け取る
=begin

ブロックをオブジェクトとして受け取ることで、
メソッド外で利用したり、callメソッドで呼び出したりできる。
Procオブジェクトを利用する。
また、複数の引数を渡す場合に、最後の引数を「&引数名」の形にすると、
Procオブジェクトとしてみなされる。このような引数は、ブロック引数を呼ばれる。

=end

hello = Proc.new do |name|
    puts("Hello, #{name}")
end

hello.call('Ruby')