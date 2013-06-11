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
    that.fillNewPostForm();

    return that;
  },

  renderPost: function (post) {
    var that = this;

    var postDetailView = new DG.Views.PostDetailView({
      model: post
    });
    
    that.$('section.posts').append(postDetailView.render().$el);

    return that;
  },

  fillNewPostForm: function () {
    var that = this;
    
    var newPostView = new DG.Views.NewPostView({
      collection: that.model.get('posts')
    });

    newPostView.render();

    that.$('section.reply').html(newPostView.render().$el);
  }
});
