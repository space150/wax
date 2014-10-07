require "minitest/spec"
require "minitest/mock"
require "minitest/autorun"

require "wax/page"

describe Wax::Page do
  before do
    @page = Wax::Page.new ["Home", {"hero" => "hero"}]
  end
  it "should render properly" do
    renderer = Minitest::Mock.new
    renderer.expect(:render, "<rendered_html>", [Wax::Page])
    @page.render_with(renderer)

    renderer.verify
  end

  it "should have a url" do
    @page.url.must_equal "home"
  end
end
