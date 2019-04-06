formRequestControl = (function () {
  var serverUrl = 'https://webhook.site/f439c352-3d4c-474d-9118-38a9e5a4727f';
  var $element  = $('#contact-form');
  var $button   = $element.find('#send-form-btn');
  var $email    = $element.find('#email');
  var $name     = $element.find('#name');

  $button.on('click', handleRequest.bind(this));

  function handleRequest() {
    if (validFields()) {
      sendFormData();
    }
  }

  function validFields() {
    handleEmailField();
    handleNameField();

    return (validEmailField() && validNameField());
  }

  function validEmailField() {
    var email = $email.val();
    var re = /^(([^<>()\[\]\\.,;:\s@']+(\.[^<>()\[\]\\.,;:\s@']+)*)|('.+'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    return re.test(String(email).toLowerCase());
  }

  function handleEmailField() {
    if (validEmailField()) {
      $email.removeClass('is-invalid')
    } else {
      $email.addClass('is-invalid')
    }
  }

  function validNameField() {
    var name = $name.val();

    return (name != '');
  }

  function handleNameField() {
    if (validNameField()) {
      $name.removeClass('is-invalid')
    } else {
      $name.addClass('is-invalid')
    }
  }

  function sendFormData() {
    data = {
      email: $email.val(),
      name: $name.val()
    }

    handleElementsBeforePost();

    $.ajax({
      type: 'POST',
      url: serverUrl,
      data: data,
      success: function(response) {
        handleElementsAfterPost()
      },
      // Webhook.site is returning error
      error: function(response) {
        handleElementsAfterPost()
      }
    });
  }

  function handleElementsBeforePost() {
    $button.attr('disabled', 'disabled');
    $button.addClass('disabled');
    $button.html('Enviando...');
  }

  function handleElementsAfterPost() {
    $('#success-alert').fadeTo(2000, 500).slideUp(500, function(){
      $('#success-alert').slideUp(500);
    });

    $button.html('Enviar');
    $button.removeClass('disabled');
    $button.attr('disabled', false);
    $email.val('')
    $name.val('')
  }
});


$(document).ready(function() {
  formRequestControl();
})