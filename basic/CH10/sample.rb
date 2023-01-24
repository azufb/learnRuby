# エラー処理と例外

=begin
    
例外
→プログラムの実行中にエラーが出た場合に発生する。
プログラム自体は一時中断して、「例外処理」を探して実行。
例外処理が見つからなければ、メソッドがどういった順番で呼ばれたか(バックトレース)や
エラー詳細が記載されたメッセージが表示される。

例外処理
begin
    例外を発生させる可能性のある処理
rescue
    例外が起こった場合の処理
end

例外に関する情報(例外オブジェクト)を変数に入れて取得できる。
begin
    例外を発生させる可能性のある処理
rescue => 例外オブジェクトを代入する変数
    例外が起こった場合の処理
end

例外に関する情報を取得するためのメソッドは3つ。
class
→例外の種類

message
→例外のメッセージ

backtrace
→例外が発生した位置に関する情報

例外処理のためにメソッド全体をbegin~endで囲う場合、beginとendを省略できる。
rescue/ensure節は書く。
    
=end

def getText(targetFile)
    begin
        file = File.open(targetFile)
        text = file.read
        p(text)
    rescue => errorObj
        p('例外情報')
        p("種類： #{errorObj.class}")
        p("メッセージ： #{errorObj.message}")
        p("バックトレース： #{errorObj.backtrace}")
    end
end

#getText(ARGV[0])

# 例外が起こっても起こらなくても絶対に実行する処理はensure節をrescue節の後に入れる。

def getTextData(targetFile)
    begin
        file = File.open(targetFile)
        text = file.read
        p(text)
    rescue => errorObj
        p("例外: #{errorObj.message}")
    ensure
        p("getTextDataメソッドを実行しました。") # 例外発生の有無に関わらず、必ず実行される。
    end
end

#getTextData(ARGV[0])

# やり直し
=begin

rescue節でretryを用いると、begin以下の処理をもう一度実行できる。
ただ、retryを何度しても成功しない場合もあるため、無限ループに陥る可能性がある。

キャッチする例外をensure節で指定することも可能。クラスで指定。
ensure節を複数書いて、例外に応じた処理を記述することも可能。

=end

def tryFileOpen(targetFile)
    errorCount = 0
    begin
        file = File.open(targetFile)
    rescue => errorObj
        errorCount += 1
        p("例外#{errorCount}: #{errorObj.message}")
        # retryでbeginからやり直し
        # 無限ループにならないように、例外発生5回未満の場合はretry。
        while errorCount < 5 do
            retry
        end
    end
end

#tryFileOpen(ARGV[0])

# オリジナルの例外クラスを作ってみる
=begin

例外クラスのStandardErrorクラスを継承した新しいクラスを作り、さらにそれを継承していくなどして、
自分で例外クラスを作り出すことが可能。

=end

# 自分で例外を発生させる
=begin

raiseメソッド
RuntimeErrorを発生させる。例外オブジェクトにメッセージをセット。

=end

def causeError()
    begin
        raise "自分で例外を発生させました！"
    rescue => errorObj
        p(errorObj) # #<RuntimeError: 自分で例外を発生させました！>
    end
end

causeError()