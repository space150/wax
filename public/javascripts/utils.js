module.exports = function() {
  $.fn.tap = function (callback) {
      callback.call(this, this);
      return this;
  };

  $.fn.scrollTo = function (callback) {
    function scroll(options, event) {
      var top;
      event.preventDefault();
      top = $(options.target).offset().top + options.offset;

      $('html,body').animate({
        scrollTop: top
      }, options.speed);
      if (options.callback !== undefined) {
        options.callback(options.el);
      }
    }
    this.each(function () {
      var $el = $(this),
        options = {
          target: $el.attr('href'),
          speed: $el.data('scroll-speed') || 1000,
          offset: $el.data('scroll-offset') || 0,
          el: $el
        };
        if (typeof callback === 'function') {
          options.callback = callback;
        }
      $el.on('click', scroll.bind(this, options));
    });
    return this;
  };

  $.fn.oneByOne = function (callback, delay) {
    var count, i;
    delay = delay || 200;
    if (typeof callback === 'function') {
      this.each(function (i, el) {
        setTimeout(function() { callback(el); }, delay * i);
      });
    }
    return this;
  };

  window.log = window.console !== void(0) && Function.prototype.bind !== void(0)
    ? console.log.bind(console)
    : function() {};
};
