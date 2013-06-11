DG.Views.TopicDetailView = Backbone.View.extend({
  initialize : function () {
    var that = this;
    
    that.listenTo(that.model, 'change reset', that.render.bind(that));
    that.listenTo(that.model, 'add:posts', that.renderPost.bind(that));
    that.model.fetch();
  },

  render: function () {
    var that = this;

    var renderedContent = JST["topics/detail"]({
      topic: that.model
    });

    that.$el = $(renderedContent);
    that.model.get("posts").each(that.renderPost.bind(that));

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
