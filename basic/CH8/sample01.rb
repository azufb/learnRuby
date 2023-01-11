# クラスとは

=begin

クラス
→オブジェクトの種類を表す。オブジェクトは何らかのクラスに必ず属する。

インスタンス
→クラスに属するオブジェクトのこと。

クラスは、鯛焼きの型。インスタンスは、その型を使って焼いて作られた「鯛焼き」という食べ物。

インスタンスの作り方
各クラスのnewメソッドを使う。例）ary = Array.new
もしくは、リテラルを使う。例）ary = ["a", "b", "c"]

オブジェクトが属するクラスを知る方法
classメソッドを使って、オブジェクトがどのクラスに属しているのか知ることができる。

オブジェクトがあるクラスのインスタンスであるか知る方法
instance_of?メソッドを使う。不思議な感じがするけど、クエスチョンマークまでがメソッド！

=end

# インスタンスを作ってみる
ary = Array.new
print(ary, "\n")

ary2 = ["a", "b", "c"]
print(ary2, "\n")

# どのクラスに属しているのか調べる
str = "あいうえお"
print("str: ", str.class, "\n")
num = 100
print("num: ", num.class, "\n")
obj = {hoge: 'hoge', fuga: 'fuga'}
print("obj: ", obj.class , "\n")
ary = [1, 2, '3', 4, 5, '6']
print("ary: ", ary.class, "\n")
bool = false
print("bool: ", bool.class, "\n")
regex = /a-z/
print("regex: ", regex.class, "\n")

# オブジェクトがあるクラスのインスタンスであるか調べる
print("str instance_of: ", str.instance_of?(String), "\n") # true
print("str instance_of: ", str.instance_of?(Array), "\n") # false

# 継承
=begin

継承
→定義されているクラスをベースとして拡張・新しくクラスを作ること。
ベースになった定義済みのクラスを「スーパークラス」、新しく作られたクラスを「サブクラス」と呼ぶ。
RubyのクラスはBasicObjectクラスのサブクラスになる。
また、組み込みのオブジェクトは、BasicObjectクラスのサブクラスであるObjectクラスのサブクラスである。

=end