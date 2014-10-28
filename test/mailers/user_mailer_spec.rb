require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "#welcome" do
    let(:user) { create(:user) }

    it "sends a welcome email for the specified user" do
      email = UserMailer.welcome(user).deliver

      expect(ActionMailer::Base.deliveries).not_to be_empty

      expect(email.to).to match_array([user.email])
      expect(email.to_s).to match(/Welcome to Kataklimb, #{user.name}!/)
    end
  end
end
