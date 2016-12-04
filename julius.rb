#! /usr/bin/ruby
# -*- coding: utf-8 -*-

require 'julius'

julius = Julius.new
julius.each_message do |message, prompt|
  prompt.pause
  #prompt.terminate
  case message.name
  when :RECOGOUT
    command = message.sentence
    
    case command
    when "テレビ","電源"
    	system(`irsend SEND_ONCE TV power`)
    	puts "テレビの電源をつけました"
    when "１","２","３","４","５","６","７","８","９","１０","１１","１２"
    	s = command.tr
    	system(`irsend SEND_ONCE TV #{s}`)
    	puts "#{command} チャンネルに変更しました"
    when "音量上げる"
    	system(`irsend SEND_ONCE TV volume_up`)
    	puts "音量を上げました"
    when "音量下げる"
    	system(`irsend SEND_ONCE TV volume_down`)
    	puts "音量を下げました"
    when "入力切替"
    	system(`irsend SEND_ONCE TV change_mode`)
    	puts "入力を変えています..."
    when "番組情報"
    	system(`irsend SEND_ONCE TV show_info`)
    	puts "番組情報を表示します"
    when "番組表"
    	system(`irsend SEND_ONCE TV show_list`)
    	puts "番組表を表示します"
    when "戻る"
    	system(`irsend SEND_ONCE TV back`)
    	puts "前の画面に戻ります"
    when "決定"
    	system(`irsend SEND_ONCE TV select`)
    	puts "決定を押しました"
    when "データ連動"
    	system(`irsend SEND_ONCE TV data_mode`)
    	puts "データ通信を起動します"
    when "赤"
    	system(`irsend SEND_ONCE TV red`)
    	puts "赤色です"
    when "緑"
    	system(`irsend SEND_ONCE TV green`)
    	puts "緑色です"
    when "青"
    	system(`irsend SEND_ONCE TV blue`)
    	puts "青色です"
    when "黄色"
    	system(`irsend SEND_ONCE TV yellow`)
    	puts "黄色です"
    when "上"
    	system(`irsend SEND_ONCE TV up`)
    	puts "上"
    when "下"
    	system(`irsend SEND_ONCE TV down`)
    	puts "下"
    when "右"
    	system(`irsend SEND_ONCE TV right`)
    	puts "右"
    when "左"
    	system(`irsend SEND_ONCE TV left`)
    	puts "左"
    else
    	puts "聞き取れませんでした"
    	puts command
    end
  end
  prompt.resume
end