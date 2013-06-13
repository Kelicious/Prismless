DG.Models.User = Backbone.RelationalModel.extend({
  profilePath: function () {
    return "/users/" + this.get("id");
  },

  gravatarUrl: function () {
    return "https://secure.gravatar.com/avatar/" + $.gravatar(this.get("email"));
  }
});
