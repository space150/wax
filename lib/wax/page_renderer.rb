require "mustache"
require "json"

module Wax
  class PageRenderer
    def initialize(opts)
      @template_path = opts[:template_path]
      @partials_path = opts[:partials_path]
      @data_path     = opts[:data_path]
      @layout        = opts[:layout]
    end

    def render(page)
      content = page.modules.map do |mod|
        template = File.join(@template_path, mod.template) + ".mustache"
        data     = File.join(@data_path, mod.data) + ".json"
        Mustache.render File.read(template), JSON.parse(File.read(data))
      end
      Mustache.render File.read(@layout), content: content.join("")
    end
  end
end
