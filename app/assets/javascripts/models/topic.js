DG.Models.Topic = Backbone.RelationalModel.extend({
  urlRoot: '/topics',
  relations: [{
    type: Backbone.HasMany,
    key: 'posts',
    relatedModel: 'DG.Models.Post',
    collectionType: 'DG.Collections.Posts',
    reverseRelation: {
      key: 'topic',
      includeInJSON: 'id'
    }
  }]
});
