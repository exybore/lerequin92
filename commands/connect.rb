module LeRequin92
  $bot.command(:connect,
              description: 'Se connecter à un salon vocal') do |event|
    channel = event.author.voice_channel
    event.message.delete
    unless channel
      event.send_temporary_message ':x: Vous devez être connecté à un salon vocal.', 2
      next
    end
    $bot.voice_connect(channel)
  end
end