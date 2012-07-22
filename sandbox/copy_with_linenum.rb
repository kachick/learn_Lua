#! ruby -Ks
# -*- coding: Shift_JIS -*-

=begin
比較用Ruby
コマンドライン引数で渡されたテキストファイル「ほにゃ.uga」を読み込み、先頭に行番号を付加した「ほにゃ.uga.with_lineno.txt」を生成する
Test / Ruby1.8.7
=end

open ARGV[0] do |src|
	open "#{ARGV[0]}.with_lineno.txt", 'w' do |dst|
		src.each_with_index do |line, i|
			dst << "#{i + 1}:#{line}"
		end
	end
end