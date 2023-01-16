# モジュール

=begin

モジュールとは、処理の部分をまとめる機能。
対してクラスは、データと処理をもった1つの「もの」を表現している。
つまり、クラスの中には、データとモジュール(処理)が含まれている。(mix-in)

メソッド名が既存のメソッドやインスタンスメソッドと被ってしまうのを防ぐために、
モジュール内の関数をモジュール関数とする。呼び出す際には、モジュール名.メソッド名。

名前空間(メソッドや変数を管理する範囲)に、同じ名前のメソッドや変数があったら、衝突してしまう。
それを防ぐために、モジュールの中で名前を付けて、モジュール名.メソッド名で参照。
ただし、includeを使えば、モジュール外の名前空間にそのモジュールが持つメソッドや定数を取り込むことが可能。
その場合、モジュール名の記述は省略できる。

モジュールの作り方
モジュール名は、クラスと同じく大文字から始める。
モジュールをモジュール関数として外部で利用できるようにするためには、
module_function :シンボルで公開する。
module モジュール名
    モジュール定義
    module_function :モジュール名
end

=end

module HelloModule
    VERSION = "1.0"

    def hello(name)
        puts "Hello, #{name}"
    end

    # モジュール関数として利用できるように公開する
    module_function :hello
end

p HelloModule::VERSION
HelloModule.hello('Ruby')

# 現在の名前空間に、モジュールが持つメソッドや定数をインクルード
include HelloModule
p VERSION
hello("TypeScript")