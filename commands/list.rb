module LeRequin92
  $bot.command(:list,
               description: 'Lister tous les sons disponibles',
               channels: [272639973352538123]) do |event|
    sounds = ''
    ::Dir.each_child(CONFIG['sounds']['folder']) do |sound|
      sound.sub!(/\.#{CONFIG['sounds']['format']}/, '')
      sounds += "• #{sound}\n"
    end

    if sounds == ''
      event.send_message ':x: Aucun son n\'est disponible. Contactez l\'administrateur du robot pour plus d\'informations.'
    else
      event.send_embed '', ::Discordrb::Webhooks::Embed.new(
        color: CONFIG['customization']['color'],
        title: 'Liste des sons',
        description: sounds
      )
    end
  end
end