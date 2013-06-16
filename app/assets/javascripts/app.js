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
      type: $(this).hasClass('up') ? 'POST' : 'DELETE',
      url: '/posts/' + $post.data('id') + '/votes'
    }).done(setLikesCount);

    // not using preventDefault because link behavior is overridden by Rails
    return false;
  });

  var $communityNav = $('section.nav');
  var $buttonSection = $communityNav.find('section.favorite-buttons');

  var setFavoriteVisibility = function (response) {
    if (response.isFavorite) {
      $('.unfavorite').removeClass('hidden');
      $('.favorite').addClass('hidden');
    } else {
      $('.favorite').removeClass('hidden');
      $('.unfavorite').addClass('hidden');
    }
  };

  $buttonSection.on('click', 'a', function () {
    var $communityNav = $(this).parent().parent();
    $.ajax({
      type: $(this).hasClass('favorite') ? 'POST' : 'DELETE',
      url: '/communities/' + $communityNav.data('id') + '/favorites'
    }).done(setFavoriteVisibility);
    return false;
  });
});
