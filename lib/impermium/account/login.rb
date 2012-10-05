module Impermium
  module Login
    def login(user_id, attempt_id, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :attempt_id => attempt_id
        )
      rest_post("login", options, &block)
    end
    
    def login_analyst_feedback(user_id, attempt_id, desired_result, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :attempt_id => attempt_id,
        :desired_result => desired_result
        )
      rest_post("login/analyst_feedback", options, &block)
    end
  end
end
