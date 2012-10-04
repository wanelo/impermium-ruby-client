module Impermium
  module Signup
    def signup(user_id, options={}, &block)
      options.merge!(
        :user_id => user_id
        )
      post("signup", options, &block)
    end
    
    def signup_analyst_feedback(user_id, desired_result, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :desired_result => desired_result
        )
      post("signup/analyst_feedback", options, &block)
    end
  end
end
