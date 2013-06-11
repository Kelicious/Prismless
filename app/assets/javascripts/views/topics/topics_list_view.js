DG.Views.TopicsListView = Backbone.View.extend({
  initialize: function () {
    var that = this;

    that.collection.on("reset change", that.render.bind(that));
    that.collection.on("add", that.renderTopicSummary.bind(that));
  },

  render: function () {
    var that = this;
    
    renderedContent = JST["topics/list"]();
    that.$el = $(renderedContent);
    that.collection.each(that.renderTopicSummary.bind(that));
    return that;
  },

  renderTopicSummary: function (topic) {
    var that = this;

    var topicSummaryView = new DG.Views.TopicSummaryView({
      model: topic
    });

    that.$('section.topics').prepend(topicSummaryView.render().$el);
  }
});
