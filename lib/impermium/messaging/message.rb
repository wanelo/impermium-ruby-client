module Impermium
  module Messaging
    def message(user_id, message_id, content, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :message_id => message_id,
        :content => content                     
        )
      post("message", options, &block)
    end
    
    def message_analyst_feedback(user_id, message_id, desired_result, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :message_id => message_id,
        :desired_result => desired_result
        )
      post("message/analyst_feedback", options, &block)
    end

    def message_user_feedback(user_id, message_id, desired_result, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :message_id => message_id,
        :desired_result => desired_result
        )
      post("message/user_feedback", options, &block)
    end
    
    
  end
end
