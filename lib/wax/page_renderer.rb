require "mustache"
require "json"

module Wax
  class PageRenderer
    def initialize(paths)
      @paths = paths
      Mustache.template_path = @paths[:partials]
    end

    def render(page)
      puts "-> Rendering page: #{page.name}"
      Mustache.render(
        File.read(@paths[:layout]),
        render_containers(page.containers)
      )
    rescue => e
      puts "Error rendering page: #{e}"
      puts e.backtrace
    end

    private

    def render_containers(containers)
      containers.each_with_object({}) do |container, obj|
        obj[container.name] = render_modules(container.modules)
      end
    end

    def render_modules(modules)
      modules.map do |mod|
        template = get_template(mod.template)
        data     = get_data(mod.data)
        Mustache.render(template, data)
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
