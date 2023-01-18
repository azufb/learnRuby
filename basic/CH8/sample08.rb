# Mix-in

=begin
    
mix-in
→クラスに指定されたモジュールを引き継ぐこと。取り込むこと。

include モジュール名

includeされているかどうかを調べるには、include?メソッドを使う。

Rubyは、複数のスーパークラスを持てない単純継承モデルを採用しているが、Mix-inを使うことによって、
複数のクラスでメソッドや定数を共有することができる。

=end

module Hello
    def hello(name)
        "Hello, #{name}"
    end
end

class Sample
    include Hello
end

sample = Sample.new
# includeしたモジュールを使ってみる。
puts sample.hello("Ruby")
# SampleクラスにHelloモジュールがincludeされているか見てみる
puts Sample.include?(Hello)

# すでにあるクラスのメソッドの挙動を変更する場合などには、prepend
class Greeting
    prepend Hello

    # クラスでモジュールで定義しているのと同じメソッドが定義されている。
    def hello(name)
        "こんにちは、#{name}"
    end
end

greeting = Greeting.new
puts greeting.hello("TypeScript")
# モジュールのメソッドでクラスのメソッドを上書き。Hello, TypeScriptと返ってくる。

# extendメソッド
=begin

extendメソッド
→モジュールで定義されたすべてのメソッドを特異メソッドとしてオブジェクトに追加する機能。

特異クラス・特異メソッド
→クラスそのものをレシーバとするクラスメソッドを定義するクラスを特異クラスと言う。
特異クラスの中で定義されたクラスメソッドを、特異メソッドと呼ぶ。

extendメソッドは、クラスの中で使って、クラスにクラスメソッドを取り込むことができる。

=end

module Edition
    def edition(n)
        "#{self} 第#{n}版"
    end
end

str = "たのしいRuby"
str.extend(Edition)
puts str.edition(6)