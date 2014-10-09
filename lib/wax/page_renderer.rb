require "mustache"
require "json"

module Wax
  class PageRenderer
    def initialize(paths)
      @paths = paths
    end

    def render(page)
      begin
        puts "-> Rendering page: #{page.name}"
        content = page.modules.map do |mod|
          template = File.join(@paths[:templates], mod.template) + ".mustache"
          data     = File.join(@paths[:data], mod.data) + ".json"
          puts mod.template + "..."
          Mustache.render File.read(template), JSON.parse(File.read(data, encoding: "bom|utf-8"))
        end
        Mustache.render File.read(@paths[:layout]), content: content.join("")
      rescue => e
        puts "Error rendering page: #{e}"
        puts e.backtrace
      end
    end
  end
end
