# 文字列オブジェクト
print("Hello, Ruby.\n");
# シングルクウォートだと、改行コードなどの特殊文字の解釈を行わない。
# 特殊文字を利用するなら、ダブルクウォートを使用する。

# メソッド
# メソッドでは、括弧を省略することができる。

# printメソッド
# テキストを表示。
# カンマで区切れば、複数のテキストをカンマつなぎで表示できる。
print 'Hello, Ruby.', 'Goodbye, JavaScript.';

# putsメソッド
# printメソッドと同じく、テキストを表示する。
# printメソッドと異なるのは、最後に必ず改行が入ること。
# 複数のテキストをカンマ区切りで繋げられるが、それぞれの最後に改行が入ってしまう。
puts('Hello, RUBY!!');
puts('HELLO', 'HELLO', 'Ruby');

# pメソッド
# printメソッドやputsメソッドと同じく、テキストを表示するメソッド。
# 文字列か数値かがわかるように表示する。
puts('100'); # 100と表示。文字列オブジェクトか数値オブジェクトがわからない。
puts(100); # 100と表示。文字列オブジェクトか数値オブジェクトがわからない。
p('100'); # "100"と表示。文字列オブジェクトであることがわかる。
p(100); # 100と表示。数値オブジェクトであることがわかる。

# 日本語の表示
puts('いづれの御時にか女御更衣あまたさぶらいたまいけるなかに');
puts('いとやむごとなき際にはあらぬがすぐれて時めきたまふありけり');