require 'tty-font'
require 'tty-prompt'
require 'colorize'

font = TTY::Font.new(:doom)
prompt = TTY::Prompt.new

puts font.write("Welcome to the MMM:").colorize(:red)
puts font.write("Mood Music Maker").colorize(:white)





 
