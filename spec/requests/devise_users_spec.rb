require 'rails_helper'

RSpec.describe "DeviseUsers", type: :request do
let(:user) { create(:user) }
let(:user_params) { attributes_for(:user) }
let(:invalid_user_params) { attributes_for(:user, name: "") }

  describe "POST #create" do
    before do
      ActionMailer::Base.deliveries.clear
    end

    context "パラメータが正常な場合" do
      it "リクエストが成功すること" do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      it "新規作成がされること" do
        expect do
        post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end

      it "リダイレクトされること" do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to edit_user_registration_path
      end
    end

    context "パラメータが不正な場合" do
      it 'createが失敗すること' do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.to_not change(User, :count)
      end

      it 'エラーが表示されること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.body).to include "エラーが発生したため ユーザ は保存されませんでした。"
      end
    end
  end

  describe "GET #index" do
    context "ログイン済ユーザーとして" do
      it "正常にレスポンスが返ること" do
        user = create(:user)
        sign_in user
        get root_path
        expect(response).to have_http_status "200"
      end
    end
  end

end
