require "minitest/spec"
require "minitest/autorun"

require "wax/config"

describe Wax::Config do
  before do
    root = File.join(Dir.pwd, "fixtures", "one")
    @config = Wax::Config.new(root)
  end

  it "has proper configuration values" do
    @config.paths.must_be_instance_of Hash
    @config.pages.must_be_instance_of Hash

    # Ensure config has all the directories it needs.
    @config.paths.must_include :data
    @config.paths.must_include :build
    @config.paths.must_include :templates
    @config.paths.must_include :partials
    @config.paths.must_include :symlink
  end
end
