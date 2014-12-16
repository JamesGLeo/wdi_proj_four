var Sign = Backbone.Model.extend({});

var SignList = Backbone.Collection.extend({
  model: Sign,
  url: ''
});

var SignView = Backbone.View.extend({
  tagName: 'li',
  template: _.template($("#sign-template").html()),
  events: {
    "click" : "toggleDetails"
  },
  render: function(){
    this.$el.html( this.template({ sign: this.model.toJSON()}));
    return this;
  },
  toggleDetails: function(){
    this.$el.find('.details').slideToggle();
  }
});

var SignListView = Backbone.View.extend({
  initialize: function() {
    this.listenTo( this.collection, 'reset', this.render );
  },
  render: function() {
    this.$el.empty();
    var that = this;
    this.collection.each(function(sign) {
      var view = new SignView({model: sign});
      that.$el.append(view.render().$el);
    });
  }
});

function getParams(){
  return {
    day: $('#day').val(),
    borough: $('#borough').val()
  }
}


$(function(){
  signList = new SignList();
  signListView = new SignListView({
    collection: signList,
    el: "#signs"
  });
  signList.fetch({reset: true});

  $('select').on('change', function(e){
    signList.fetch({
      reset: true,
      data: getParams()
    });
  })

});











