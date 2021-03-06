# Impermium Ruby Client#

Ruby wrapper for the [Impermium API](http://impermium.com).

* gem version 1.0.0 supports the Impermium API version 4.0

## Usage ##

In order to use Impermium gem you must get an Impermium API key.

### Instantiate and configure a client ###

The Impermium client can be instantiated and configured in several ways. A new client can be created with:

    client = Impermium.new(:api_key => <your_api_key>)

which is actually short for

    client = Impermium::Client.new(:api_key => <your_api_key>)

Constructor accepts a hash of options that can be used to configure the Impermium client. Valid hash keys are:

* `:adapter` (sets Faraday adapter)
* `:api_version` (sets Impermium API version - default 4.0)
* `:api_key` (sets API key)
* `:client_name` (sets client name)
* `:client_id` (sets client ID)
* `:endpoint` (sets URL to Impermium server - default http://api.impermium.com)

Any of these values can be set directly too:

* client = Impermium.new
* client.api_key = <your_api_key>
* client.endpoint = "http://api-test.impermium.com"

Finally, the Impermium client can be configured through a block with:

    Impermium.configure do |conf|
      conf.api_key = <your_api_key>
      conf.endpoint = "http://api-test.impermium.com"
    end

    client = Impermium.new

### Calling API methods  ###

Each method accepts the mandatory arguments of the corresponding API call, and takes an options hash and a block as optional arguments. Here is the list of all supported methods and their mandatory arguments:
 
####__ACCOUNT__####
+ __Signup:__
  - `client.signup(user_id)`
  - `client.signup_analyst_feedback(user_id, desired_result)`
+ __Profile:__
  - `client.profile(user_id, profile_id)`
  - `client.profile_analyst_feedback(user_id, profile_id, desired_result)`
+ __Login:__
  - `client.login(user_id, attempt_id)`
  - `client.login_analyst_feedback(user_id, attempt_id, desired_result)`

####__CONTENT__####
+ __Post:__
  - `client.post(user_id, post_id, content)`
  - `client.post_analyst_feedback(user_id, post_id, desired_result)`
  - `client.post_user_feedback(user_id, post_id, reporter_user_type, desired_result)`
  
+ __Url:__
  - `client.url(user_id, url)`
  - `client.url_analyst_feedback(user_id, url, desired_result)`
  - `client.url_user_feedback(user_id, url, reporter_user_type, desired_result)`

###__MESSAGING__###
+ __Message:__
  - `client.message(user_id, message_id, content)`
  - `client.message_analyst_feedback(user_id, message_id, desired_result)`
  - `client.message_user_feedback(user_id, message_id, desired_result)`
  

Additional arguments can be passed through the hash which is the last argument for every method

    client.signup('cool_user_id_33', {:alias => "user33", :password_hash=>'7d222a5d269a'})

If request headers have to be set it can be done through a block:

    Impermium.signup('cool_user_id_33') do |req|
      req.headers = {:http_user_agent => "Impermium gem 1.0.0"}
    end

You can find the complete arguments lists and types in the official Impermium API docs site.

### Responses ###

Any method call receiving a successful response from impermium API will return a Hash-like structure containing the body of the response, typically including `response_id`, `timestamp` and a nested Hash with key <API_VERSION> and a deeper hash object which has "action", "tags", "tag_details", etc.

Any 4XX response will raise an Impermium Exception with the body of the response in the error message.

* A 400 status response from the impermium API will raise an `Impermium::BadRequest`
* A 401 status response from the impermium API will raise an `Impermium::UnauthorizedRequest`
* A 403 status response from the impermium API will raise an `Impermium::ForbiddenRequest`
* A 404 status response from the impermium API will raise an `Impermium::NotFoundRequest`

## Credits ##

Here is the [list of contributors](https://github.com/impermium/impermium-ruby-client/contributors)\.

