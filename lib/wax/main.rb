require "yaml"

module Wax
  class Main
    attr_reader :config

    def initialize(root)
      @root   = root
      @config = read_config
    end


    private

    def read_config
      YAML.load_file(File.join @root, "Waxfile")
    end
  end
end
