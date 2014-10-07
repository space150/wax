require "wax/module"

module Wax
  class Page
    attr_reader :name, :modules

    # Does this need a root_dir param?
    def initialize(page)
      @name = page.first
      @modules = page.last.map do |template, data|
        Wax::Module.new(template, data)
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
