module Wax
  class Page
    attr_reader :name, :modules

    # Does this need a root_dir param?
    def initialize(page)
      @page = page
    end

    def render_with(renderer)
      renderer.render self
    end
  end
end
