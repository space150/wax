require "mustache"
require "json"

module Wax
  class PageRenderer
    def initialize(paths)
      @paths = paths
    end

    def render(page)
      content = page.modules.map do |mod|
        template = File.join(@paths[:templates], mod.template) + ".mustache"
        data     = File.join(@paths[:data], mod.data) + ".json"
        Mustache.render File.read(template), JSON.parse(File.read(data))
      end
      Mustache.render File.read(@paths[:layout]), content: content.join("")
    end
  end
end
