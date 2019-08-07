require 'discordrb'
require 'json'

config = JSON.parse(File.read(File.dirname(__FILE__) + '/config.json'))

bot = Discordrb::Commands::CommandBot.new(token: config['token'],
                         log_mode: config['debug'] ? :debug : :normal,
                         client_id: config['client_id'],
                         prefix: config['prefix'],
                         help_command: false)

bot.ready do
  bot.voice_connect(272641655709106176)
  puts 'Connected to Discord'
  bot.game = 'tirer sur la daronne'
end

bot.message(in: 272639973352538123, starts_with: '92:') do |event|
  sound_name = event.content.sub(/92:/, '')
  next if sound_name == 'list'
  
  event.message.delete
  voice = event.voice
  sound_file = Dir.pwd + "/sounds/#{sound_name}.mp3"

  unless File::exist?(sound_file)
    event.send_temporary_message ":x: Son inconnu. Faites `92:list` pour voir la liste des sons disponibles.", 2
    next
  end

  voice.play_file(Dir.pwd + "/sounds/#{sound_name}.mp3")
end

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

bot.run
