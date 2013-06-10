DG.Views.TopicDetailView = Backbone.View.extend({
  initialize : function () {
    var that = this;
    
    that.$el = that.options.$el;
    that.model.on('change reset', that.render.bind(that));
    that.model.on('add:posts', that.renderPost.bind(that));
  },

  render: function () {
    var that = this;

    var renderedContent = JST["topics/detail"]({
      topic: that.model
    });

    that.$el.html(renderedContent);

    return that;
  },

  renderPost: function(post) {
    var that = this;

    var postDetailView = new DG.Views.PostDetailView({
      model: post
    });

    that.$('section.posts').append(postDetailView.render().$el);
    return that;
  }
});
