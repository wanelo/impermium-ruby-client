require "spec_helper"
require "json"

describe "user API section" do
  describe "signup object" do
    before(:each) do
      @user_id = "whi543"
      @desired_result = {:"4.0" => { :tags => ["not_spam"] }}
    end

    describe "signup method" do
      describe "missing arguments" do
        context "missing user_id" do
          use_vcr_cassette
          it "should raise BadRequest error" do
            lambda { Impermium.signup(nil) }.should raise_error(Impermium::BadRequest, /user_id/)
          end
        end
      
      describe "successful signup" do
        use_vcr_cassette
        it "should mark user with zero spam classifier score" do
          res = Impermium.profile(@user_id)
          res.spam_classifier.score.to_i.should == 0
          res.spam_classifier.label.should == "notspam"
        end
      end
    end
  end
end
