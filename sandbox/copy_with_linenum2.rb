#! ruby -Ks
# -*- coding: Shift_JIS -*-

=begin
比較用Ruby2
コマンドライン引数で渡されたテキストファイル「ほにゃ.uga」を読み込み、先頭に行番号を付加した「ほにゃ.uga.with_lineno.txt」を生成する
Test / Ruby1.8.7
=end


# 先に書き込み先ファイルを作ってしまうけど、こんな感じにすればネストを減らせる
open "#{ARGV[0]}.with_lineno.txt", 'w' do |dst|
	i = 0
	File.foreach ARGV[0] do |line|
		dst << "#{i += 1}:#{line}"
	end
end