DG.Routers.TopicsRouter = Backbone.Router.extend({
  initialize: function ($content, topics) {
    ROUTER = this;
    var that = this;

    that.$content = $content;
    that.topics = topics;
  },

  routes: {
    "": "index",
    "topics/new": "new",
    "topics/:id": "show"
  },

  index: function () {
    var that = this;
    var topicsListView = new DG.Views.TopicsListView({
      collection: that.topics
    });
    that.topics.fetch();
    that.$content.html(topicsListView.render().$el);
  },

  show: function (id) {
    var that = this;

    var topic = that.topics.get(id);

    var topicDetailView = new DG.Views.TopicDetailView({
      $el: that.$content,
      model: topic
    });

    that.$content.html(topicDetailView.render().$el);
  },

  new: function () {
    var that = this;

    var newTopicView = new DG.Views.NewTopicView({
      collection: that.topics
    });

    that.$content.html(newTopicView.render().$el);
  }
});
