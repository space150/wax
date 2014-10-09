require "wax/module"

module Wax
  class Page
    attr_reader :name, :modules

    def initialize(page)
      @name = page.first
      @modules = page.last.map do |mod|
        Wax::Module.new(mod.keys.first, mod.values.first)
      end
    end

    def url
      @name.downcase
    end

    def render_with(renderer)
      renderer.render self
    end
  end
end
