# # VENDOR DEPS
$ = require('../javascripts/vendor/jquery-1.11.1.min')
# Expose jQuery
window.$ = window.jQuery = $
require('../javascripts/vendor/flyLabel.min.js')
require('../javascripts/vendor/jquery.validate.min.js')


# # APPLICATION CODE
Utils = require('../javascripts/utils')
GenericForm = require("./generic-form")


# Gimme those helpers!
Utils()


$(->
  #
  # Generic Form
  #
  $genericForm = $ '.js-generic-form'
  if $genericForm.length
    new GenericForm $genericForm
)
