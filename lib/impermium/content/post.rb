module Impermium
  module Post
    REPORTER_USER_TYPE_VALUES = ["ENDUSER", "MODERATOR"] # => default first
    def post(post_id, user_id, content, options={}, &block)
      options.merge!(
        :post_id => post_id,
        :user_id => user_id,
        :content => content,
        )
      post("post", options, &block)
    end
    
    def post_analyst_feedback(user_id, post_id, desired_result, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :post_id => post_id,
        :desired_result => desired_result
        )
      post("post/analyst_feedback", options, &block)
    end
    
    def post_user_feedback(user_id, post_id, reporter_user_type, desired_result, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :post_id => post_id,
        :reporter_user_type => REPORTER_USER_TYPE_VALUES.include?(reporter_user_type) ? reporter_user_type : REPORTER_USER_TYPE_VALUES.first,
        :desired_result => desired_result
        )
      post("blog_post/user_feedback", options, &block)
    end
  end
end
