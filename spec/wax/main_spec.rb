require "minitest/spec"
require "minitest/autorun"

require "wax"

describe Wax::Main do
  it "can read the Waxfile" do
    wax = Wax::Main.new(File.join(Dir.pwd, "fixtures/one"))
    wax.config.must_be_instance_of Hash
    wax.config["directories"].must_be_instance_of Hash
    wax.config["pages"].must_be_instance_of Hash
  end
end
