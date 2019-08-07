require 'discordrb'
require 'json'

config = JSON.parse(File.read(File.dirname(__FILE__) + '/config.json'))

bot = Discordrb::Bot.new(token: config['token'],
                         log_mode: config['debug'] ? :debug : :normal,
                         client_id: config['client_id'],)

bot.ready do
  bot.voice_connect(272641655709106176)
  puts 'Connected to Discord'
  bot.game = 'tirer sur la daronne'
end

bot.message(in: 272639973352538123, starts_with: '92:') do |event|
  voice = event.voice
  sound_name = event.content.sub(/92:/, '')
  event.message.delete
  voice.play_file(Dir.pwd + "/sounds/#{sound_name}.mp3")
end

bot.run
