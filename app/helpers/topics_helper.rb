module TopicsHelper
  def backbone_topic_path(topic)
    "#{forum_path(topic.forum)}/#topics/#{topic.id}"
  end
end
