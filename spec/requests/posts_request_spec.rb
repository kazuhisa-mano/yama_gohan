require 'rails_helper'

RSpec.describe "Posts", type: :request do
  # describe '編集のテスト' do
  #   context '自分の投稿の編集画面への遷移' do
  #     it '遷移できる' do
  #       visit edit_post_path(post)
  #       expect(current_path).to eq('/posts/' + post.id.to_s + '/edit')
  #     end
  #   end
  # end  
  
  # describe '新規投稿ページ' do
  #   context "新規投稿ページが正しく表示される" do
  #     let(:user) { create(:user) }
  #     let!(:user2) { create(:user) }
  #     let!(:book) { create(:book, user: user) }
  #     let!(:book2) { create(:book, user: user2) }
  #     before do
  #       visit new_user_session_path
  # 	    fill_in 'user[name]', with: user.name
  # 	    fill_in 'user[password]', with: user.password
  # 	    click_button 'ログイン'
  #     end
  #     before do
  #       get new_post_path
  #     end
  #     it 'リクエストは200 OKとなること' do
  #       expect(response.status).to eq 200
  #     end
  #   end
  # end
end
