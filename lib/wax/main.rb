require "yaml"

require "wax/config"
require "wax/page"
require "wax/page_renderer"

module Wax
  class Main
    attr_reader :config

    def initialize(root)
      @config = Wax::Config.new(root)

      @pages = @config.pages.map do |page|
        Wax::Page.new(page)
      end

      @page_renderer = Wax::PageRenderer.new(
        template_path: @config.dirs["templates"],
        partials_path: @config.dirs["partials"],
        data_path:     @config.dirs["data"]
      )
    end

    def build_all
      clean_build_dir
      @pages.each do |page|
        save_page(
          File.join(page.url, "/index.html"),
          page.render_with(@page_renderer)
        )
      end
      create_symlinks
    end

    private

    def clean_build_dir
      FileUtils.rm_rf @config.dirs["build"]
      FileUtils.mkdir_p @config.dirs["build"]
    end

    def save_page(filename, contents)
      page_file = File.join(@config.dirs["build"], filename)
      FileUtils.mkdir_p(File.dirname(page_file))
      File.open(page_file, "w") { |f| f.write(contents) }
    end

    def create_symlinks
      @config.dirs["symlink"].each do |link|
        FileUtils.ln_s link, @config.dirs["build"]
      end
    end
  end
end
