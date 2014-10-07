require "minitest/spec"
require "minitest/mock"
require "minitest/autorun"

require "wax/page"

describe Wax::Page do
  it "should render properly" do
    page = Wax::Page.new ["Home", {"hero" => "hero"}]
    renderer = Minitest::Mock.new
    renderer.expect(:render, "<rendered_html>", [Wax::Page])
    page.render_with(renderer)

    renderer.verify
  end
end
