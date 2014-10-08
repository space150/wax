require "minitest/spec"
require "minitest/autorun"

require "wax"

describe Wax::Main do
  before do
    @wax = Wax::Main.new(File.join(Dir.pwd, "fixtures/one"))
  end

  it "can read the Waxfile" do
    @wax.config.wont_be_nil
  end

  it "has proper configuration values" do
    @wax.config.dirs.must_be_instance_of Hash
    @wax.config.pages.must_be_instance_of Hash

    # Ensure config has all the directories it needs.
    %w{
      data build templates partials symlink
    }.each do |dir|
      @wax.config.dirs.must_include dir
    end
  end

  it "can build the project" do
    @wax.build_all
    [
      "home/index.html",
      "about/index.html",
      "public"
    ].each do |file|
      path = "#{@wax.config.dirs['build']}/#{file}"
      assert File.exists?(path), path
    end
  end
end
