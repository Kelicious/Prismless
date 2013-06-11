DG.Collections.Topics = Backbone.Collection.extend({
  url: '/topics',
  urlRoot: '/topics',
  model: DG.Models.Topic
});
