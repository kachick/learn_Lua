#! lua

--[[
コマンドライン引数で渡されたテキストファイル「ほにゃ.uga」を読み込み、先頭に行番号を付加した「ほにゃ.uga.with_lineno.txt」を生成する
Test / Lua 5.1.3
--]]

io.output(arg[1]..'.with_lineno.txt')

lineNum = 0

for line in io.lines(arg[1]) do
	lineNum = lineNum + 1
	io.write(string.format("%d:", lineNum)..line.."\n")
end