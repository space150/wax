var assert = require("assert"),
    Wax = require("../");

describe("Wax", function() {
  describe("new Wax", function() {
    it("should return a new instance if called without 'new'", function() {
      assert(Wax() instanceof Wax);
    });
  });
});
