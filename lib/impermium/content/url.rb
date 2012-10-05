module Impermium
  module Url
    REPORTER_USER_TYPE_VALUES = ["ENDUSER", "MODERATOR"] # => default first
    
    def url(user_id, url, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :url => url
        )
      rest_post("url", options, &block)
    end
    
    def url_analyst_feedback(user_id, url, desired_result, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :url => url,
        :desired_result => desired_result
        )
      rest_post("url/analyst_feedback", options, &block)
    end
    
    def url_user_feedback(user_id, url, reporter_user_type, desired_result, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :url => url,                
        :reporter_user_type => REPORTER_USER_TYPE_VALUES.include?(reporter_user_type) ? reporter_user_type : REPORTER_USER_TYPE_VALUES.first
        )
      rest_post("url/user_feedback", options, &block)
    end
  end
end
