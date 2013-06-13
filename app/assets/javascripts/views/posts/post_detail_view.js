DG.Views.PostDetailView = Backbone.View.extend({
  tagName: "article",
  className: "post",

  initialize: function () {
    var that = this;

    that.model.on('change', that.render.bind(that));
    that.model.on('change:author', that.render.bind(that));
  },

  render: function () {
    var that = this;

    var renderedContent = JST["posts/detail"]({
      post: that.model
    });

    that.$el.html(renderedContent);
    return that;
  }
});
