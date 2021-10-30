require 'rails_helper'

RSpec.describe Reply, type: :model do
  before do
    @user = create(:test_user)
    @post = create(:post, user_id: @user.id)
    @reply = create(:reply, user_id: @user.id, post_id: @post.id)
  end

  describe "バリデーションの検証" do
    it "回答が作成できていること" do
      expect(@reply).to be_valid
    end

    it "回答が空では登録できないこと" do
      @reply.content = ''
      expect(@reply).not_to be_valid
    end
  end
end
