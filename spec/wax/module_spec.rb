require "minitest/spec"
require "minitest/autorun"

require "wax/module"

describe Wax::Module do
  it "should have template and data paths" do
    mod = Wax::Module.new("hero", "hero")
    mod.template.wont_be_nil
    mod.data.wont_be_nil
  end
end
