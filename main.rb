require 'discordrb'
require 'json'

module LeRequin92
  CONFIG = ::JSON.parse(::File.read(::File.dirname(__FILE__) + '/config.json'))
  COMMANDS = %w(list connect)

  $bot = ::Discordrb::Commands::CommandBot.new(token: CONFIG['token'],
                          log_mode: CONFIG['debug'] ? :debug : :normal,
                          client_id: CONFIG['client_id'],
                          prefix: CONFIG['prefix'],
                          help_command: false)

  $bot.ready do
    puts 'Connected to Discord'
    $bot.game = 'tirer sur la daronne'
  end

  ::Dir.each_child('commands') do |command|
    require_relative "commands/#{command}"
  end

  $bot.run
end
