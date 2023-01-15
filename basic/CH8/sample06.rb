# 特異クラスと特異メソッド

=begin

任意のオブジェクトのみが利用できるメソッド(特異メソッド)を定義できる。
class << オブジェクト名
    def 特異メソッド名
        処理
    end
end

任意のクラスのみが利用できるようにする場合は、オブジェクト名の部分がクラス名になる。
    
=end

# 例）変数str1のみが利用できるhelloメソッドを定義。
str1 = "Ruby"
str2 = "JavaScript"

class << str1
    def hello
        "Hello, #{self}!"
    end
end

# インスタンス作成は不要。
p str1.hello
# p str2.hello
# undefined method `hello' for "JavaScript":String (NoMethodError)