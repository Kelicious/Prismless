DG.Collections.Posts = Backbone.Collection.extend({
  model: DG.Models.Post,
  comparator: function (post) {
    return post.get("created_at");
  }
});
