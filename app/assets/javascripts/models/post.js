DG.Models.Post = Backbone.RelationalModel.extend({
  urlRoot: '/posts',
  schema: {
    body: {
      title: 'New Post',
      type: 'TextArea',
      validators: ['required']
    }
  },
  relations: [{
    type: Backbone.HasOne,
    key: 'author',
    relatedModel: 'DG.Models.User'
  }]
});
