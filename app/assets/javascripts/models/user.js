DG.Models.User = Backbone.RelationalModel.extend({
  profilePath: function () {
    return "/users/" + this.get("id");
  },

  gravatarUrl: function () {
    var email = this.get("email").trim().toLowerCase();
    return "https://secure.gravatar.com/avatar/" + $.gravatar(email);
  }
});
