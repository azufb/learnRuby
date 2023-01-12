# クラスを作る

=begin
    
クラスの作り方
クラスを定義するには、class文を使う。クラス名は大文字から始める。
class クラス名

    ・initializeメソッドを定義。
    ・newメソッドを使ってインスタンスを作成するときに呼ばれる。
    def initialize(引数)
        ・インスタンス変数(@で始まる変数)の初期化。インスタンスごとに異なる値でOK。
        ・インスタンス変数は、インスタンスメソッドから参照可能。
        @変数名 = 引数 
    end

    ・アクセスメソッドの定義(attr_reader シンボル/attr_writer シンボル/attr_accessor シンボル)
    ・参照のみ/変更のみ/参照変更両方の3種類があり、インスタンス変数を示すシンボルを渡すことで、
    インスタンス変数にアクセスできるアクセスメソッドを作成できる。
    attr_reader :インスタンス変数名

    attr_accessor :インスタンス変数名

    ・メソッドのレシーバを参照するには、selfという変数を使う。
    def 変数名
        puts "#{self.変数}"
    end
end

class文の中では、定数を定義することも可能。すべて大文字。
クラス名::定数名で外部から参照できる。

そのインスタンスでも参照できる、クラス変数もある。@@変数名。
ただ、クラス外部から参照するためには、アクセスメソッドを用意する必要がある。こちらは、attr_メソッドは使えないため、自前で定義。

クラスメソッドの作り方
クラスメソッドは、class << クラス名 ~ endの形式の特異クラス定義の中に、インスタンスメソッドの形式で記述。
一般的はクラスの中に作ることも可能。
    
=end

# クラスを作ってみる
class Sample
    # 定数
    CONST_VAL = '定数'

    # クラス変数
    # whatIsYourNameメソッドを実行したら、trueに変える。
    @@answerNameBool = false

    # initializeメソッドで初期化。
    def initialize(name, age, gender)
        # インスタンス変数の初期化。
        @name = name
        @age = age
        @gender = gender
    end

    # 自前でインスタンス変数にアクセスするインスタンスメソッド作成。
    def whatIsYourName
        @@answerNameBool = true
        return @name
    end

    # アクセスメソッドでインスタンス変数にアクセスできるようにする。
    attr_reader :age

    # アクセスメソッドでインスタンス変数の中身を変更できるようにする。
    attr_accessor :gender

    # レシーバを参照してみる(ageメソッド)
    def getReceiver
        puts("レシーバ： #{self.age}")
    end

    # クラス変数にアクセスするためのインスタンスメソッド作成。
    def accessInstnceVariable
        @@answerNameBool
    end

end

# Sampleクラスのインスタンス作成。引数は、名前・年齢・性別。
sample = Sample.new('Hanako', 24, 'N/A')

# 名前と年齢、性別を取得してみる。
puts("名前: #{sample.whatIsYourName}")
puts("年齢: #{sample.age}")
puts("性別:before #{sample.gender}")

# 性別の書き換えを行なってみる。
sample.gender = 'female'

# 性別を再度取得してみる。
puts("性別:after #{sample.gender}")

# レシーバを参照してみる。
sample.getReceiver

# 定数を取得してみる。
p("定数: #{Sample::CONST_VAL}")

# クラス変数を取得してみる。
puts("クラス変数: #{sample.accessInstnceVariable}")
