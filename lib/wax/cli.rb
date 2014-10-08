require "thor"
require "wax/main"

module Wax
  class CLI < ::Thor
    desc "build", "build the project"
    def build
      Wax::Main.new(Dir.pwd).build_all
    end
  end
end
