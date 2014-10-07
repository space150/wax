require "yaml"

module Wax
  class Main
    attr_reader :config

    def initialize(root)
      @config = read_config(root)
    end


    private

    def read_config(dir)
      config = YAML.load_file(File.join(dir, "Waxfile"))
      # Set defaults.
      config["directories"]["data"] ||= "wax/data"
      config["directories"]["build"] ||= "wax/build"
      return config
    end
  end
end
