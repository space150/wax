require "mustache"
require "json"

module Wax
  class PageRenderer
    def initialize(opts)
      @template_path = opts[:template_path]
      @partials_path = opts[:partials_path]
      @data_path     = opts[:data_path]
    end

    def render(page)
      page.modules.map do |mod|
        template = File.join(@template_path, mod.template) + ".mustache"
        data     = File.join(@data_path, mod.data) + ".json"
        Mustache.render File.read(template), JSON.parse(File.read(data))
      end.join("\n")
    end
  end
end
