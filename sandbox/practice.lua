#! lua

--[[
Test / Lua 5.1.3
--]]

seq_num = 1

function print_seq()
	print(string.format('------- %d -------', seq_num))
	seq_num = seq_num + 1
end

function sample1()
	print_seq()
	local month = 12
	local days = month * 30

	return days
end

print(sample1())


function sample2()
	print_seq()
	print([[test \n for literal]])
	print('test \n for literal')
end

sample2()

-- この行はコメント

--[[
この行もまた
コメント
]]---

function sample3_table()
	print_seq()
	local book = {title = 'UsoTitle', price = 700}
	print(book)
	print(book.title)
	print(book.price)
	print(book.nanika)
end

sample3_table()

function sample4()
	print_seq()
	-- nilとfalseのみが偽値扱い
	if nil then
		print('s_nil')
	elseif false then
		print('s_false')
	elseif 8 then
		print('s_8')
	else
		print('s_other')
	end
end

sample4()


function sample5()
	print_seq()
	-- while試そう
	local idx = 0
	
	while idx < 5 do
		print('while test')
		idx = idx + 1
	end
end

sample5()

function sample6()
	print_seq()
	-- for試そう(初期宣言は自動でローカル変数)
	for idx = 3, 8 do
		print(idx, idx * 7)
	end
end

sample6()

function sample7()
	print_seq()
	-- 配列も、あくまでテーブル（RubyのOpenStructっぽい）として表現する
	local array = {1, 2, 900, 'sss'}
	print(array[1], array[4], array[5], array[-1], array.age)
	print(table.getn(array))
end

sample7()

-- tableの中身全部足し合わせた値を返す
function sum_old(args)
	result = 0
	
	for idx = 1, table.getn(args) do
		result = result + args[idx]
	end

	return result
end

-- table.getnは現在非推奨で、かわりに長さオペレータを使う
function sum_new(args)
	result = 0
	
	for idx = 1, #args do
		result = result +args[idx]
	end

	return result
end

function sample8()
	print_seq()
	print(sum_old({1, 2, 3, 4, 5, 6, 7, 8, 9, 10}))
	print(sum_new({1, 2, 3, 4, 5, 6, 7, 8, 9, 10}))
end

sample8()

function no_action()
end

function sample9()
	print_seq()

	print(no_action)
	print(no_action())
	print(nil)
end

sample9()

function sample10()
	stra = 7
	local str1 = 'cisco'; str2 = 'allied'
end

print_seq()

-- straがグローバルと扱われていない＆未定義変数はエラーでなくnil返し
print(stra, str9999)

sample10()

-- と思ったら、関数の呼び出し時に定義されるってだけみたい。変数宣言はlocal必須かな
print(stra, str2)

function sample10()
	-- 文字列操作として、upper、lower＆連結関数の一例
	local str1 = string.upper('cisco')
	local str2 = string.lower('YAMAHA')
	print(str1..str2)
end

-- functionの上書きは可能。
sample10()

function sample11()
	print_seq()	
	local like_hash = {top = 'A', bottom = 'Z'}
	local like_array = {'a', 'b', 'c'}
	-- forのましな使い方として、pairsやipairsとの組み合わせがある
	
	-- pairs使うと、Rubyのハッシュに対するeach_pair的動作に。順不動
	for key, value in pairs(like_hash) do
		print(key, value)
	end
	
	-- ipairs使うと、RubyのArrayに対するeach_with_index的動作に。インデックス順アクセス
	for idx, value in ipairs(like_array) do
		print(idx, value)
	end
end

sample11()

function sample12()
	print_seq()
	local target = 'Yamaha-Router'
	-- sub / index指定での文字列切り抜き
	print(string.sub(target, 2, 3))
	-- find / その文字列がある位置を調べる
	print(string.find(target, 'r'))
	print(string.find(target, 'E'))
	print(string.find(target, 'ou'))
end

sample12()