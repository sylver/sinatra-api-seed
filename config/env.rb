#!/usr/bin/env ruby

# Initialize global environments variables
require 'dotenv'
Dotenv.load

# Include root application path in the loading path variable
require 'pathname'
$:.unshift(Pathname.new(__FILE__).realpath.dirname.parent.to_s)
