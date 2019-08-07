require 'discordrb'
require 'json'

config = JSON.parse(File.read(File.dirname(__FILE__) + '/config.json'))

bot = Discordrb::Commands::CommandBot.new(token: config['token'],
                         log_mode: config['debug'] ? :debug : :normal,
                         client_id: config['client_id'],
                         prefix: config['prefix'],
                         help_command: false)

bot.ready do
  puts 'Connected to Discord'
  bot.game = 'tirer sur la daronne'
end

commands = %w(list connect)

bot.command(:list,
            description: 'Lister tous les sons disponibles',
            channels: [272639973352538123]) do |event|
  sounds = ''
  Dir.each_child('sounds') do |sound|
    sounds += "• #{sound.sub(/\.mp3/, '')}\n"
  end
  event.send_embed('', Discordrb::Webhooks::Embed.new(
    color: config['color'],
    title: 'Liste des sons',
    description: sounds
  ))
end

bot.command(:connect,
            description: 'Se connecter à un salon vocal') do |event|
  channel = event.author.voice_channel
  unless channel
    event.send_message(':x: Vous devez être connecté à un salon vocal.')
    next
  end
  bot.voice_connect(channel)
end

bot.message(starts_with: '92:') do |event|
  sound_name = event.content.sub(/92:/, '')
  next if commands.include? sound_name
  
  event.message.delete
  voice = event.voice
  sound_file = Dir.pwd + "/sounds/#{sound_name}.mp3"

  unless File::exist?(sound_file)
    event.send_temporary_message ':x: Son inconnu. Faites `92:list` pour voir la liste des sons disponibles.', 2
    next
  end

  voice.play_file(sound_file)
end

bot.run
