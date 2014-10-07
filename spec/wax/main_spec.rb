require "minitest/spec"
require "minitest/autorun"

require "wax"

describe Wax::Main do
  before do
    @wax = Wax::Main.new(File.join(Dir.pwd, "fixtures/one"))
  end

  it "can read the Waxfile" do
    @wax.config.must_be_instance_of Hash
  end

  it "has proper configuration values" do
    @wax.config["directories"].must_be_instance_of Hash
    @wax.config["directories"].must_include "data"
    @wax.config["directories"].must_include "build"
    @wax.config["directories"].must_include "templates"
    @wax.config["directories"].must_include "partials"
    @wax.config["directories"].must_include "symlink"

    @wax.config["pages"].must_be_instance_of Hash
  end
end
