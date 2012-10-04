require "impermium/account/signup"
require "impermium/account/profile"
require "impermium/account/login"

module Impermium
  module Account    
    include Signup
    include Profile
    include Login
  end
end
