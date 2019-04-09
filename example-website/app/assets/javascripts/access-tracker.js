accessTracker = (function () {
  var cookieName           = 'icasei-access-tracker';
  var serverUrl            = 'http://localhost:3000/visits';
  var daysToExpiresCookies = 30;

  function sendVisitorData() {
    var guid            = getVisitorGuid();
    var url             = accessedUrl();
    var accessedAt = getCurrentDateTime();

    params = {
      guid: guid,
      url: url,
      accessed_at: accessedAt
    }

    postData(params);
  }

  function postData(params) {
    var http = new XMLHttpRequest();
    var queryString = convertParamsToQueryString(params);

    http.open('POST', serverUrl, true);
    http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    http.withCredentials = true;
    http.onreadystatechange = function() {
      if(http.readyState == 4 && http.status == 200) {
        console.log('Response 200 OK');
      }
    }
    http.send(queryString);
  }

  function convertParamsToQueryString(params) {
    var searchParams = new URLSearchParams();
    Object.keys(params).forEach(key => searchParams.append(key, params[key]));

    return searchParams.toString();
  }

  function setVisitorGuid() {
    var cookies = cookieName + '=' + generateGuid();
    var expires = ';expires=' + cookieExpirationDate() + '; path=/';

    document.cookie = cookies + expires;
  }

  function cookieExpirationDate() {
    var date = new Date();
    var expiresAt = date.getTime() + (daysToExpiresCookies*24*60*60*1000);

    date.setTime(expiresAt);

    return date.toUTCString();
  }

  function getVisitorGuid() {
    var currentGuid = readVisitorGuid();

    if (currentGuid === '') {
      setVisitorGuid();
    }

    return readVisitorGuid();
  }

  function readVisitorGuid() {
    var pattern = new RegExp('(?:(?:^|.*;\s*)' + cookieName + '\s*\=\s*([^;]*).*$)|^.*$');
    var guid    = document.cookie.replace(pattern, '$1');

    return guid;
  }

  function generateGuid() {
    return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
      (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
    )
  }

  function accessedUrl() {
    return window.location.href;
  }

  function getCurrentDateTime() {
    var date = new Date();

    return date.toUTCString();
  }

  sendVisitorData();
});

/* If the client website does not use turbolinks, use this code block.
var domReady = function(callback) {
  if (document.readyState === 'interactive' || document.readyState === 'complete') {
    callback()
  } else {
    document.addEventListener('DOMContentLoaded', callback)
  };
};
domReady(accessTracker());
*/

// If the client website does use turbolinks (like most Rails apps), listen for the turbolinks event.
document.addEventListener('turbolinks:load', function () {
  accessTracker();
})