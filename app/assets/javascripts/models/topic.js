DG.Models.Topic = Backbone.RelationalModel.extend({
  relations: [{
    type: Backbone.HasMany,
    key: 'posts',
    keyDestination: 'posts_attributes',
    relatedModel: 'DG.Models.Post',
    collectionType: 'DG.Collections.Posts',
    reverseRelation: {
      key: 'topic',
      keyDestination: 'topic_id',
      includeInJSON: 'id'
    }
  }],
  schema: {
    title: {
      type: 'Text',
      validators: ['required']
    },
    body: {
      type: 'TextArea',
      validators: ['required']
    }
  }
});
