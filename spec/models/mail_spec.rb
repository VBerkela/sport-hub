require "rails_helper"

RSpec.describe CommentMailer, :type => :mailer do
  describe "notify" do
    let(:user) { build(:user) }
    let(:comment) { build(:comment) }
    let(:mail) { CommentMailer.new_comment_email(comment, user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Check new comment!")
      expect(mail.from).to eq(["volodymyr.berkela@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Welcome to our site")
    end
  end
end
