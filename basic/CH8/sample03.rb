# メソッドの呼び出しを制限する

# クラスのインスタンスを作成すると、クラスの内部で定義されているメソッドはインスタンスメソッドとして利用できる。
# インスタンスメソッドとして利用してほしくないメソッドがある場合、呼び出しを制限することができる。
=begin
    
def クラス名
    処理
end

・以下のように、キーワードにクラスを示すシンボルを渡す。
キーワード :クラス名

・キーワードは次の3種類。
public
→インスタンスメソッドとして公開。

private
→インスタンスメソッドとしては使用不可。クラス内部のみ使用可能。レシーバを指定して呼び出せないようにする。

protected
→同じクラスであればインスタンスメソッドとして使用できる。

複数のメソッドの使用を制限する場合は、それらのメソッドを記述する前にキーワードだけを置く。
それ以降に記述されたメソッドに、そのキーワードが適用される。
    
=end

class AccessTest
    def pub
        puts 'pub is a public method'
    end

    # キーワード シンボル
    public :pub

    def priv
        puts 'priv is a private method'
    end

    private :priv

    def prot
        puts 'prot is a protected method'
    end

    # 同一クラスとそのクラスを継承したサブクラスからのみ呼び出せる。
    protected :prot

    # これ以降、すべてpublic
    public
    def pub2
        puts 'pub2'
    end

    def pub3
        puts 'pub3'
    end

    # これ以降、すべてprivate
    private

    def priv2
        puts 'priv2'
    end

    def priv3
        puts 'priv3'
    end
end

accessTest = AccessTest.new
accessTest.pub
# accessTest.priv private method `priv' called for #<AccessTest:0x0000000104472ed0> (NoMethodError)
accessTest.pub2
accessTest.pub3
# accessTest.priv2 private method `priv2' called for #<AccessTest:0x000000010d0f1f78> (NoMethodError)