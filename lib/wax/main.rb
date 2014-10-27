require "yaml"
require "mustache"

require "wax/config"
require "wax/page"
require "wax/page_renderer"

module Wax
  class Main
    attr_reader :config

    def initialize(root)
      @root = root
      @config = Wax::Config.new(@root)
      @pages = build_pages
      @page_renderer = Wax::PageRenderer.new @config.paths
    end

    def build_all
      clean_build_dir
      @pages.each do |page|
        save_page(
          File.join(page.url, "/index.html"),
          page.render_with(@page_renderer)
        )
      end
      save_page "index.html", build_homepage
      create_symlinks
    end

    private

    def build_pages
      @config.pages.map do |page|
        Wax::Page.new(page)
      end
    end

    def clean_build_dir
      FileUtils.rm_rf File.join(@config.paths[:build], "*")
      FileUtils.mkdir_p @config.paths[:build]
    end

    def save_page(filename, contents)
      page_file = File.join(@config.paths[:build], filename)
      FileUtils.mkdir_p(File.dirname(page_file))
      File.open(page_file, "w") { |f| f.write(contents) }
    end

    def build_homepage
      Mustache.render(
        File.read(@config.paths[:layout]),
        content: Mustache.render(
          File.read(@config.paths[:index_template]),
          pages: @pages.map { |page| { name: page.name, url: "/#{page.url}/" } }
        )
      )
    end

    def create_symlinks
      @config.paths[:symlink].each do |link|
        FileUtils.ln_s link, @config.paths[:build], force: true
      end

    rescue
      puts "Error creating symlinks!"
    end
  end
end
