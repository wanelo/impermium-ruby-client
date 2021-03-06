module Impermium
  module Message
    def message(user_id, message_id, content, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :message_id => message_id,
        :content => content                     
        )
      rest_post("message", options, &block)
    end
    
    def message_analyst_feedback(user_id, message_id, desired_result, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :message_id => message_id,
        :desired_result => desired_result
        )
      rest_post("message/analyst_feedback", options, &block)
    end

    def message_user_feedback(user_id, message_id, desired_result, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :message_id => message_id,
        :desired_result => desired_result
        )
      rest_post("message/user_feedback", options, &block)
    end
    
    
  end
end
