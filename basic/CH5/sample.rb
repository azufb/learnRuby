# 条件判断

# if文
=begin

if 条件式 then
    文
end

最初の条件式がfalseだった場合、別の条件式で判定したいときは、elsifを加える。
全てfalseの場合を表現するのは、else。
if 条件式 then
    文
elsif 条件式2 then
    文
elsif 条件式3 then
    文
else
    文
end

=end

personTaro = {name: '太郎', age: 24}
personHanako = {name: '華子', age: 28}
if personTaro[:age] > personHanako[:age] then
    puts("#{personTaro[:name]}は、#{personHanako[:name]}の先輩だ。")
elsif personTaro[:age] < personHanako[:age] then
    puts("#{personTaro[:name]}は、#{personHanako[:name]}の後輩だ。")
else
    puts("#{personTaro[:name]}は、#{personHanako[:name]}と同期だ。")
end

# unless文
=begin

条件が偽の場合にのみ、動作する条件判断がunless文。
elseを入れることも可能。
unless 条件式 then
    文
end

=end

unless personTaro[:age] > personHanako[:age] then
    puts("#{personTaro[:name]}は、#{personHanako[:name]}より年上ではない。")
end

# case文
=begin

1つのオブジェクトの値を対象にして、値に応じて場合分けをするときは、case文を使う。
case 対象のオブジェクト
when 値1 then
    文
when 値2 then
    文
when 値3 then
    文
else
    文
end

=end

ages = [0, 20, 60]
ages.each do |age|
    case age
    when 0
        puts('生まれたー！人間界デビューだ！')
    when 20
        puts('おめでとう！成人だね！大人デビューだ！')
    when 60
        puts('ついに還暦だ。よくここまで来たね。')
    else
        puts('人生まだまだこれからだ！')
    end
end
