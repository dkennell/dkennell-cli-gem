require 'irb'
require 'bundler'
require 'open-uri'
require 'nokogiri'
Bundler.require

require_all './lib'
Dir["../*"].each {|file| require file }
