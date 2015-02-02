var ToDo = {};

ToDo.init = function(){
  $(window).on('keyup', ToDo.listen);
}

ToDo.listen = function(e){
  if (e.keyCode == 45) {
    ToDo.createFromSelection();
  }
};

ToDo.createFromSelection = function(){
  var selection = getSelectionText();
  $.ajax({ 
  url: '/to_dos',
  data: {to_do: {name: selection}},
  method: 'post',
  headers:{
    Accept: 'text/javascript, application/javascript, application/ecmascript, application/x-ecmascript'
  }
  }); 

}


function getSelectionText() {
  var text = "";
  if (window.getSelection) {
    text = window.getSelection().toString();
  } else if (document.selection && document.selection.type != "Control") {
    text = document.selection.createRange().text;
  }
  return text;
}