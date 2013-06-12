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
  },
  creator: function () {
    return this.get("posts").first().get("author");
  },
  lastPoster: function () {
    return this.get("posts").last().get("author");
  },
  lastPostTime: function () {
    return this.get("posts").last().get("created_at");
  }
});
