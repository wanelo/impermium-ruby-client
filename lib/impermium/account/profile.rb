module Impermium
  module Profile
    def profile(user_id, profile_id, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :profile_id => profile_id
        )
      post("profile", options, &block)
    end
    
    def profile_analyst_feedback(user_id, profile_id, desired_result, options={}, &block)
      options.merge!(
        :user_id => user_id,
        :profile_id => profile_id,
        :desired_result => desired_result
        )
      post("profile/analyst_feedback", options, &block)
    end
  end
end
