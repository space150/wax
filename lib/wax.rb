# Set up the load path.
lib = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "wax/version"
require "wax/main"
