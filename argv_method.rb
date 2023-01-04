# ARGVは、コマンドライン引数を受け取ることができる。
# メソッド作成
=begin

def メソッド名(引数)
    処理
end

=end

def argvMethod(argvNames)
    argvNames.each do |name|
        puts("こんにちは、#{name}さん！")
    end
end

argvMethod(ARGV)