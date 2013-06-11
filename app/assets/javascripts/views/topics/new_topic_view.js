DG.Views.NewTopicView = Backbone.View.extend({
  events: {
    'click button.submit': 'submit'
  },

  render: function () {
    var that = this;

    that.$el.html(JST["topics/new"]);
    that.addForm();

    return that;
  },

  addForm: function () {
    var that = this;

    that.topic = new DG.Models.Topic();
    
    that.form = new Backbone.Form({
      model: that.topic
    });

    that.$('div.new-topic-form').html(that.form.render().$el);
  },

  submit: function (e) {
    var that = this;
    var post = new DG.Models.Post({body: that.$('textarea[name=body]').val()});
    that.topic.get('posts').add(post);
    var errors = that.form.commit({validate: true});
    if (_(errors).isEmpty()) {
      that.collection.create(that.topic);
    }
  }
});
