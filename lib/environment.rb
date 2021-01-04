# this will require all my files, bundle them up and send them to the bin so they can communicate
require_relative "./cats_cli/version"

#this will load my gemfile, otherwise it will not know about my gems
require 'bundler'
Bundler.require

require_relative "./cats_cli/cli"
require_relative "./cats_cli/api"
require_relative "./cats_cli/cat"
