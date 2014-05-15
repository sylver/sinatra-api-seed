#!/usr/bin/env ruby

require './config/env'
require './config/db'

# Main Rakefile loading every tasks splitted across
# specific files by namespace
Dir["tasks/*.rake"].sort.each { |task| load task }
