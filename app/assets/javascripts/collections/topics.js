DG.Collections.Topics = Backbone.Collection.extend({
  initialize: function (___, options) {
    this.forumId = options.forumId;
  },
  url: function () {
    return '/forums/' + this.forumId + '/topics';
  },
  model: DG.Models.Topic
});
