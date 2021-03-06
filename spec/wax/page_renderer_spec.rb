require "minitest/spec"
require "minitest/autorun"

require "wax/config"
require "wax/page"
require "wax/page_renderer"

describe Wax::PageRenderer do
  before do
    root = File.join(Dir.pwd, "fixtures", "one")
    config = Wax::Config.new(root)
    @renderer = Wax::PageRenderer.new(config.paths)
    @page = Wax::Page.new ["Home", config.pages["Home"]]
  end

  it "should render things properly" do
    output = @renderer.render(@page)
    output.must_be_instance_of String
    # In <title>, from layout:
    output.must_match "Wax Fixture One"
    # In the "hero" template:
    output.must_match "Hello from the JSON"
    # In the "section" templates:
    output.must_match "I&#39;m just a section"
    output.must_match "I&#39;m an alternate section"
    # In the partial:
    output.must_match "I'm a partial"
  end

  it "works the same way through Page#render_with" do
    @renderer.render(@page).must_equal @page.render_with(@renderer)
  end
end
