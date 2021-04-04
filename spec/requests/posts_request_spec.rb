require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "#index" do
    context "投稿一覧ページが正しく表示される" do
      before do
        get posts_path
      end
      it "リクエストは200 OKとなること" do
        expect(response.status).to eq 200
      end
      it "タイトルが正しく表示されていること" do
        expect(response.body).to include("投稿一覧")
      end
    end
  end
  
  
end
