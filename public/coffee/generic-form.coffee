#### Generic Form
#
#  * Used for validation on any form
#

class GenericForm
  constructor: (@form) ->
    @errorClass = 'has-error'
    @validClass = 'success'

    # start up jQuery Validation
    @_initValidation(@form)


  _initValidation: =>
    @form.validate
      errorClass: @errorClass
      validClass: @validClass
      ignore: '.js-ignore-validation, :hidden'
      errorPlacement: (error, el) =>
        el.parent().addClass(@errorClass).append(error)
      unhighlight: (element) =>
        $(element).parent().removeClass(@errorClass).addClass(@validClass)



#export the goods
module.exports = GenericForm
