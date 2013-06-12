DG.Models.User = Backbone.RelationalModel.extend({
  profilePath: function () {
    return "/users/" + this.get("id");
  }
});
