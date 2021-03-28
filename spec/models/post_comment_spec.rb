require 'rails_helper'

RSpec.describe PostComment, type: :model do
  describe "#create" do
    it "commentは100文字以下であること" do
      post_comment = PostComment.new(comment: "a"*101)
      post_comment.valid?
      expect(post_comment.errors[:comment]).to include("is too long (maximum is 100 characters)")
    end
  end
end
