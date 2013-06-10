DG.Views.TopicSummaryView = Backbone.View.extend({
  initialize: function () {
    var that = this;

    that.model.on('change', that.render.bind(that));
  },

  render: function () {
    var that = this;

    var renderedContent = JST["topics/summary"]({
      topic: that.model
    });

    that.$el.html(renderedContent);
    return that;
  }
});
