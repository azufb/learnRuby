# ARGVは、コマンドライン引数を受け取ることができる。
# メソッド作成
=begin

def メソッド名(引数)
    処理
end

=end

def argvMethod(argvName)
    name = argvName
    puts("こんにちは、#{name}さん！")
end

argvMethod(ARGV[0])