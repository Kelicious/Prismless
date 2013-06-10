DG.Models.Topic = Backbone.RelationalModel.extend({
  urlRoot: '/topics',
  relations: [{
    type: Backbone.HasMany,
    key: 'posts',
    relatedModel: 'DG.Models.Post',
    reverseRelation: {
      key: 'topic',
      includeInJSON: 'id'
    }
  }]
});
