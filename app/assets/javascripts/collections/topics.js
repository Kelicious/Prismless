DG.Collections.Topics = Backbone.Collection.extend({
  initialize: function (___, options) {
    this.forumId = options.forumId;
  },

  model: DG.Models.Topic,

  url: function () {
    return '/forums/' + this.forumId + '/topics';
  },

  comparator: function (topic) {
    return topic.get("last_post_at");
  }
});
