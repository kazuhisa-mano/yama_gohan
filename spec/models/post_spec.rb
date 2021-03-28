require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
  end

  describe '#create' do
    before do
      @user = FactoryBot.create(:user) #User must exist, User can't be blank
    end

    it "name, image_id, material, recipe, cooking_timeが存在すれば登録できること" do
      post = build(:post)
      user = @user
      post.user_id = user.id #User must exist, User can't be blank
      expect(post).to be_valid
    end

    it "nameが無い場合は登録できないこと" do
      post = build(:post, name: "")
      user = @user
      post.user_id = user.id
      post.valid?
      expect(post.errors[:name]).to include("can't be blank")
    end

    it "image_idが無い場合は登録できないこと" do
      post = build(:post, image_id: "")
      user = @user
      post.user_id = user.id
      post.valid?
      expect(post.errors[:image]).to include("can't be blank")
    end

    it "materialが無い場合は登録できないこと" do
      post = build(:post, material: "")
      user = @user
      post.user_id = user.id
      post.valid?
      expect(post.errors[:material]).to include("can't be blank")
    end

    it "recipeが無い場合は登録できないこと" do
      post = build(:post, recipe: "")
      user = @user
      post.user_id = user.id
      post.valid?
      expect(post.errors[:recipe]).to include("can't be blank")
    end

    it "cooking_timeが無い場合は登録できないこと" do
      post = build(:post, cooking_time: "")
      user = @user
      post.user_id = user.id
      post.valid?
      expect(post.errors[:cooking_time]).to include("can't be blank")
    end
  end
end
