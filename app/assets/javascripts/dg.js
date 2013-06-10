window.DG = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {},

  initialize: function ($content) {
    var topicsData = $content.data('topics');
    var topics = new DG.Collections.Topics(topicsData);
    new DG.Routers.TopicsRouter($content, topics);
    Backbone.history.start();
  }
};
