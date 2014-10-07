require "yaml"

require "wax/config"
require "wax/page"
require "wax/page_renderer"

module Wax
  class Main
    attr_reader :config

    def initialize(root)
      @config = Wax::Config.new(root)

      @pages = @config.pages.map do |page|
        Wax::Page.new(page)
      end

      @page_renderer = Wax::PageRenderer.new(
        template_path: @config.dirs["templates"],
        partials_path: @config.dirs["partials"],
        data_path:     @config.dirs["data"]
      )
    end
  end
end
