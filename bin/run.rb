require_relative '../config/environment'
require 'tty-font'
require 'tty-prompt'


font = TTY::Font.new(:doom)
prompt = TTY::Prompt.new

puts font.write("Welcome to Mood Music Maker").colorize(:red)
prompt.select("What mood are you in today??", %w(Happy Sad Workout Chill Throwbacker))



