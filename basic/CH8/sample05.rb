# aliasとundef

# alias
=begin
    
すでに存在するメソッドに別の名前を付ける。
alias 別名 元の名前
もしくは、
alias :別名 :元の名前

メソッド名を使うか、シンボルを使うかどちらでもOK。
    
=end

# 例）
# helloメソッドが定義されているクラスC1を継承してクラスC2を作る。
# 継承されたhelloメソッドに別名を付けて、helloメソッドを再定義する。
class C1
    def hello
        "Hello"
    end
end

class C2 < C1
    # helloメソッドに、別名old_helloを付ける。
    alias :old_hello :hello

    # helloメソッドを再定義。
    def hello
        # 元々のhelloメソッド(別名old_hello)ではHelloを返していたが、
        # 再定義されたhelloではHello again!が返される。
        "#{old_hello} again!"
    end
end

instance = C2.new
p instance.old_hello
p instance.hello

# undef
=begin

定義されたメソッドをなかったことにしたいときに使う。
スーパークラスで定義されているメソッドをサブクラスでは削除する場合など。
undef メソッド名
もしくは、
undef :メソッド名

メソッド名を使うか、シンボルを使うかどちらでもOK。

=end

# 例）クラスC3を定義し、クラスC2に継承。
# スーパークラスC3で定義されたメソッドgreetingをサブクラスC4では使えないようにする。
class C3
    def greeting
        "Hello!"
    end

    def welcome
        "welcome"
    end
end

class C4 < C3
    # スーパークラスで定義されたメソッドgreetingをなかったことに。
    undef :greeting
end

instance2 = C4.new
# なかったことにしたgreetingメソッドにアクセスしてみる...
# p instance2.greeting undefined
# method `greeting' for #<C4:0x00000001035a17f8> (NoMethodError)

p instance2.welcome