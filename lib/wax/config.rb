module Wax
  class Config
    attr_reader :dirs, :pages

    def initialize(root)
      @root = root
      waxfile = YAML.load_file(File.join(@root, "Waxfile"))
      @dirs = clean_dirs(waxfile["directories"])
      @pages = waxfile["pages"]
    end

    private

    def clean_dirs(dirs)
      # Set defaults.
      dirs["data"]  ||= "wax/data"
      dirs["build"] ||= "wax/build"

      # Add the root path.
      %w( build data partials templates ).each do |dir|
        dirs[dir] = File.join(@root, dirs[dir])
      end

      dirs["symlink"] = dirs["symlink"].map do |path|
        File.join(@root, path)
      end

      dirs
    end
  end
end
