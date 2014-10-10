require "minitest/spec"
require "minitest/mock"
require "minitest/autorun"

require "wax/page"
require "wax/config"

describe Wax::Page do
  before do
    root = File.join(Dir.pwd, "fixtures", "one")
    config = Wax::Config.new(root)
    @page = Wax::Page.new config.pages.first
  end

  it "should have the proper structure" do
    @page.containers.wont_be_nil
    @page.containers.first.modules.wont_be_nil
  end

  it "should call the renderer's render method" do
    renderer = Minitest::Mock.new
    renderer.expect(:render, "<rendered_html>", [Wax::Page])
    @page.render_with(renderer)

    renderer.verify
  end

  it "should have a url" do
    @page.url.must_equal "home"
  end
end
