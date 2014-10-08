module Wax
  class Config
    attr_reader :paths, :pages

    def initialize(root)
      @root = root
      waxfile = YAML.load_file(File.join(@root, "Waxfile"))
      @paths = clean_paths(waxfile["paths"])
      @pages = waxfile["pages"]
    end

    private

    def clean_paths(paths)
      defaults.each_with_object({}) do |(k, v), obj|
        if v.instance_of? Array
          obj[k] = paths["symlink"].map do |path|
            File.join(@root, path)
          end
        else
          obj[k] = File.join(@root, paths.include?(k.to_s) ? paths[k.to_s] : v)
        end
      end
    end

    private

    def defaults
      {
        data: "wax/data",
        build: "wax/build",
        templates: "Views",
        partials: "Views/Partials",
        layout: "wax/templates/layout.mustache",
        index_template: "wax/templates/index.mustache",
        symlink: []
      }
    end
  end
end
