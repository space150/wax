require "mustache"
require "json"

module Wax
  class PageRenderer
    def initialize(paths)
      @paths = paths
    end

    def render(page)
      puts "-> Rendering page: #{page.name}"
      Mustache.render(
        File.read(@paths[:layout]),
        content: render_modules(page.modules)
      )
    rescue => e
      puts "Error rendering page: #{e}"
      puts e.backtrace
    end

    private

    def render_modules(modules)
      modules.map do |mod|
        template = get_template mod.template
        data     = get_data mod.data
        Mustache.render template, data
      end.join("")
    end

    def get_template(path)
      File.read(File.join(@paths[:templates], path) + ".mustache")
    end

    def get_data(path)
      JSON.parse(File.read(
        File.join(@paths[:data], path) + ".json",
        encoding: "bom|utf-8"
      ))
    end
  end
end
