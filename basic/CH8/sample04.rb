# クラスを拡張する

# 既存のクラスにメソッドを追加する
# Stringクラスに文字列の単語数を数えるメソッドを追加してみる
class String
    def count_word
        # selfで、メソッドを呼び出したオブジェクトを参照
        ary = self.split(" ") # selfを空白文字区切りで配列に分解。
        return ary.size
    end
end

str = "Just Another Ruby Newbie"
p str.count_word

# クラスを継承する
# 既存のクラスには変更を加えず、新しい機能を追加したり、一部カスタマイズしたりして、新しいクラスを作る。
=begin
    
class クラス名 < スーパークラス名
    クラス定義
end

スーパークラスは、継承元のクラス。
継承して新しく作られたクラスは、サブクラスという。

複数のクラスの共通部分だけをスーパークラスで実装して、
個別の差分をサブクラスで定義するという使い方ができる。
スーパークラスを指定していないと、Objectクラスのサブクラスになる。

Objectクラスには、多くのメソッドが定義されているが、
BasicObjectクラスだと最低限のメソッドしか定義されてイアに。
    
=end

# Arrayクラスを継承してRingArrayクラスを作ってみる。
class RingArray < Array
    # 演算子[]の再定義
    def [](i)
        # 新しいインデックスを求める
        idx = i % size
        # スーパークラスの同盟のメソッドを呼ぶ
        super(idx)
    end
end

wday = RingArray["日", "月", "火", "水", "木", "金", "土"]
p wday[6]
p wday[11]
p wday[-1]