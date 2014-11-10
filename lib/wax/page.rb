module Wax
  Container = Struct.new :name, :modules
  Module    = Struct.new :template, :data

  class Page
    attr_reader :name, :containers

    def initialize(page)
      @name = page.first
      @containers = page.last.map do |(name, modules)|
        Wax::Container.new(name, build_modules(modules))
      end
    rescue
      puts "Error with page \"#{page.first}\"."
    end

    def url
      @name.downcase.gsub(" ", "_")
    end

    def render_with(renderer)
      renderer.render self
    end

    private

    def build_modules(modules)
      modules.map do |mod|
        Wax::Module.new(mod.keys.first, mod.values.first)
      end
    end
  end
end
