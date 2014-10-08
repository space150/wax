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

  it "can build the project" do
    @wax.build_all
    [
      "index.html",
      "home/index.html",
      "about/index.html",
      "public"
    ].each do |file|
      path = "#{@wax.config.paths[:build]}/#{file}"
      assert File.exist?(path), path
    end
  end
end
