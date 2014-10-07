require "yaml"

require "wax/page"

module Wax
  class Main
    attr_reader :config

    def initialize(root)
      @config = read_config(root)
      @pages = @config["pages"].map do |page|
        Wax::Page.new(page)
      end
    end


    private

    def read_config(dir)
      config = YAML.load_file(File.join(dir, "Waxfile"))
      # Set defaults.
      config["directories"]["data"]  ||= "wax/data"
      config["directories"]["build"] ||= "wax/build"

      config
    end
    end
  end
end
