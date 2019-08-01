require 'tty-font'
require 'tty-prompt'
require 'colorize'
require 'paint'
font = TTY::Font.new(:doom)
prompt = TTY::Prompt.new

puts font.write("WELCOME to the MMM:.").colorize(:red)
puts font.write("Mood Music Maker").colorize(:red)
