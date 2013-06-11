DG.Models.Post = Backbone.RelationalModel.extend({
  urlRoot: '/posts',
  schema: {
    body: {
      title: 'New Post',
      type: 'TextArea',
      validators: ['required']
    }
  }
});
