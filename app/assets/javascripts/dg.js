window.DG = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {},

  initialize: function ($content, forumId) {
    var topicsData = $('#topics').data('topics');
    var topics = new DG.Collections.Topics(topicsData, {
      forumId: forumId
    });

    topicsCollection = topics;
    new DG.Routers.TopicsRouter($content, topics);
    Backbone.history.start();
  }
};
