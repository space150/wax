module Wax
  class Config
    attr_reader :dirs, :pages

    def initialize(dir)
      waxfile = YAML.load_file(File.join(dir, "Waxfile"))

      @dirs  = waxfile["directories"]
      @pages = waxfile["pages"]

      # Set defaults.
      @dirs["data"]  ||= "wax/data"
      @dirs["build"] ||= "wax/build"
      @dirs["templates"] = File.join(dir, @dirs["templates"])
      @dirs["data"] = File.join(dir, @dirs["data"])
    end
  end
end
