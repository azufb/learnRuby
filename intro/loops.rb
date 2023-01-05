# 繰り返し

# while文(doは省略可能。)
=begin

while 条件式 do
    繰り返す処理
end

=end

i = 1;
while i <= 10 do
    puts(i);
    i = i + 1;
end

# timesメソッド(doは省略できない！)
=begin

繰り返す回数が決まっている場合に使う。
回数.times do
    繰り返す処理
end

=end

10.times do
    puts("只今、ループ中です。");
end