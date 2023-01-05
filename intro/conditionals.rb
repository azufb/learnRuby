# 条件分岐

=begin
条件分岐の書き方

①trueのみ(thenは省略可能。)
if 条件式 then
    trueの場合に実行する処理
end

②trueの場合とfalseの場合の処理を分ける
if 条件式 then
    trueの場合に実行する処理
else
    falseの場合に実行する処理
end

=end

# 変数aの値が10以上であればgreaterと返すプログラムを書いてみる。
a = 20;
if a >= 10 then
    puts('greater!');
end

# 変数scoreの値が50以上と50以下で表示するテキストを変える。
score = 50;
if score >= 50 then
    puts('合格です！！');
=begin
elsif score <= 10
    puts('落第だ。');
=end
else
    puts('不合格です。やり直しましょう。');
end