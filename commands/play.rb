module LeRequin92
  $bot.message(start_with: CONFIG['prefix']) do |event|
    sound_name = event.content.sub(/92:/, '')
    next if COMMANDS.include? sound_name
    
    event.message.delete
    voice = event.voice
    sound_file = ::Dir.pwd + "/#{CONFIG['sounds_dir']}/#{sound_name}.mp3"

    unless ::File::exist?(sound_file)
      event.send_temporary_message ':x: Son inconnu. Faites `92:list` pour voir la liste des sons disponibles.', 2
      next
    end
    unless voice
      event.send_temporary_message ':x: Vous devez être connecté à un salon vocal afin de jouer un son.', 2
      next
    end

    voice.play_file(sound_file)
  end
end