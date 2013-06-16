$(document).ready(function () {
  var $posts = $('section.posts');

  // used for coloring the number of points, see CSS file
  var pointsClass = function (points) {
    return 'points ' + (points > 0 ? 'up' : points < 0 ? 'down' : 'neutral');
  };

  var setLikesCount = function (response) {
    var $post = $posts.find('.post[data-id=' + response.id + ']');
    $post.find('.points')
      .attr('class', pointsClass(response.points))
      .html(response.points);
  };

  $posts.on('click', 'a', function () {
    var $post = $(this).parent().parent();
    $.ajax({
      type: $(this).hasClass('up') ? "POST" : "DELETE",
      url: '/posts/' + $post.data('id') + '/votes'
    }).done(setLikesCount);

    // not using preventDefault because link behavior is overridden by Rails
    return false;
  });
});
