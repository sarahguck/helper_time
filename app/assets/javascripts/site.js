var Site = {};

$(document).ready(function(){

  $('h1').on('click', function(){
    $('#entry').find('.hidden_submit').click();
    $('#entry').removeClass('show');
  });

  Site.initFilters();
  Site.initToday();
  Site.initTabs();
  ToDo.init();

  // catch-all initializer; call last since it removes the init class
  $('.init').each(Site.initElem);
});

Site.initToday = function(){
  $("#daily_entries").sortable({
    items: "li",
    axis: "y",
    handle: ".triangle",
    placeholder: "daily",
    update: function(){
      var data = {positions: {}};
      $('.daily').each(function(i){
        data['positions'][$(this).find('.triangle').data('id')] = i;
      });
      console.log(data);
      $.ajax({ 
        url: '/sort_dailies',
        data: data,
        method: 'post',
        headers:{
          Accept: 'text/javascript, application/javascript, application/ecmascript, application/x-ecmascript'
        }
      }); 
    }
  });
  $("#daily_entries").disableSelection();
}
Site.updateDailies = function(){
  $( "#daily_entries" ).sortable( "option", "items", "> li" );
};

Site.initElem = function(){
  $(this).find('.expand_elem').on('click', Site.expandElem);
  $(this).find('.submit_on_change').on('change', Site.triggerSubmit);
  $(this).removeClass('init');
};

Site.triggerSubmit = function(){
  $(this).closest('form').find('.hidden_submit').trigger('click');
}

Site.expandElem = function(){
  $('#' + $(this).data('elem-id')).addClass('show');
  if ($(this).data('url')) {
    Site.getUrl($(this).data('url'), $(this).data('url-data'));
  }
}

Site.initTabs = function(){
  $('.tab_heading.init').on('click', Site.selectTab);
}

Site.selectTab = function(){
  $(this).closest('.half').find('.tab_content.current, .tab_heading.current').removeClass('current');
  $('#' + $(this).data('content-id')).addClass('current');
  $(this).addClass('current');
}

Site.getUrl = function(url, data, options) {
  var method = 'get';
  if (options) {
    if (options.method) {
      method = options.method; 
    }
  }
  if (!data) {
    data = {};
  }
  console.log(method);

  $.ajax({ 
    url: url,
    data: data,
    method: method,
    headers:{
      Accept: 'text/javascript, application/javascript, application/ecmascript, application/x-ecmascript'
    },
    complete:function(){

    }
  }); 
}

Site.addDaily = function(id) {

};

Site.removeDaily = function(id){
  $('#daily_entries .entry_' + id).remove();
};

Site.initFilters = function(){
  var filters = $('.filter.init');
  filters.find('label').on('click', function(){ 
    $('.filter.open').removeClass('open');
    var cont = $(this).closest('.filter');
    cont.addClass('open'); 
    setTimeout(function(){
      cont.find('input').focus();
    }, 500);
    Site.closeElemOnBodyClick(cont, 'filter');
  });
  filters.find('input').on('keyup', function(e){
    if (e.keyCode == 13) {
      var query = $(this).val();
      if (query != '') {
        Site.getUrl($(this).data('url'), {query: query});
        $(this).closest('.filter').removeClass('open');
        $(this).val('');
      }
    }
  })
}

Site.addTab = function(heading, content, select){
  console.log(heading);
  heading = $(heading);
  $('.tab_headings').first().append(heading);
  $('.tab_contents').first().append(content);
  Site.initTabs();
  $('.init').each(Site.initElem);

  if (select) {
    Site.selectTab.call(heading);
  }
};

Site.showAlert = function(text) {
  $('#alert_text').html(text);
  $('#alert').addClass('open');
  setTimeout(function(){
    $('#alert').removeClass('open');
    $('#alert_text').html('');  
  }, 3000);
}

Site.closeElemOnBodyClick = function(elem, cancel_class){
  $('body').on('click.close_elem', function(e){
    var targ = $(e.target);
    if (!(targ.hasClass(cancel_class) || targ.closest('.'+cancel_class).length)) {
      elem.removeClass('open');
      $('body').off('click.close_elem');
    }
  });
}