DG.Views.NewPostView = Backbone.View.extend({
  events: {
    'click button.submit': 'submit'
  },

  render: function () {
    var that = this;

    that.$el.html(JST['posts/new']());
    that.addForm();

    return that;
  },

  addForm: function () {
    var that = this;

    that.post = new DG.Models.Post();

    that.form = new Backbone.Form({
      model: that.post
    });
    
    that.$('div.new-post-form').html(that.form.render().$el);
  },

  submit: function (e) {
    var that = this;
    var errors = that.form.commit({validate: true});
    if (_(errors).isEmpty()) {
      that.collection.create(that.post);
    }
  }
});
