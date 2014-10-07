require "yaml"

require "wax/page"
require "wax/page_renderer"

module Wax
  class Main
    attr_reader :config

    def initialize(root)
      @config = read_config(root)

      @pages = @config["pages"].map do |page|
        Wax::Page.new(page)
      end

      @page_renderer = Wax::PageRenderer.new(
        template_path: @config["directories"]["templates"],
        partials_path: @config["directories"]["partials"],
        data_path: @config["directories"]["data"]
      )
    end

    private

    def read_config(dir)
      config = YAML.load_file(File.join(dir, "Waxfile"))
      # Set defaults.
      config["directories"]["data"]  ||= "wax/data"
      config["directories"]["build"] ||= "wax/build"
      config["directories"]["templates"] = File.join(dir, config["directories"]["templates"])
      config["directories"]["data"] = File.join(dir, config["directories"]["data"])

      config
    end
  end
end
