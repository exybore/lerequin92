require 'discordrb'
require 'json'

module LeRequin92
  CONFIG = ::JSON.parse(::File.read('config.json'))
  COMMANDS = %w(list connect)

  $bot = ::Discordrb::Commands::CommandBot.new(token: CONFIG['bot']['token'],
                          log_mode: CONFIG['debug'] ? :debug : :normal,
                          client_id: CONFIG['bot']['id'],
                          prefix: CONFIG['bot']['commands_prefix'],
                          help_command: false)

  $bot.ready do
    puts 'Connected to Discord'
    $bot.game = CONFIG['customization']['status']
  end

  ::Dir.each_child('commands') do |command|
    require_relative "commands/#{command}"
  end

  $bot.run
end
