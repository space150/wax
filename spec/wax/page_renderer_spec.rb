require "minitest/spec"
require "minitest/autorun"

require "wax/page"
require "wax/page_renderer"

describe Wax::PageRenderer do
  before do
    @renderer = Wax::PageRenderer.new(
      template_path: "fixtures/one/Views",
      data_path: "fixtures/one/wax/data"
    )
    @page = Wax::Page.new ["Home", {"hero" => "hero"}]
  end

  it "should render things properly" do
    output = @renderer.render(@page)
    output.must_be_instance_of String
    output.must_match "Hello from the JSON."
  end

  it "works the same way through Page#render_with" do
    @renderer.render(@page).must_equal @page.render_with(@renderer)
  end
end
