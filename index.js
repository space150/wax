module.exports = Wax;

function Wax(opts) {
  if (!(this instanceof Wax)) return new Wax(opts);

  this._options = opts;
}
