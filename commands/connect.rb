module LeRequin92
  $bot.command(:connect,
               description: 'Se connecter à un salon vocal') do |event|
    channel = event.author.voice_channel
    event.message.delete
    if channel
      $bot.voice_connect(channel)
    else
      event.send_temporary_message ':x: Vous devez être connecté à un salon vocal.', 2
    end
    return
  end
end