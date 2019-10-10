require 'rails_helper'

RSpec.feature "Userに関するテスト", type: :feature do
        before do
            @user1 = FactoryBot.create(:user, name: 'ユーザー1', email: 'user1@camp', password: '000000')
            @user2 = FactoryBot.create(:user, name: 'ユーザー2', email: 'user2@camp', password: '000000')
        end

    feature "User未ログイン時" do
        before do
            visit root_path
        end
        scenario 'ハンバーガーメニューの表示' do
            expect(page).to have_link 'ログイン'
            expect(page).to have_link '新規登録'
            expect(page).to have_link 'HOME'
            expect(page).to have_link 'MAPで検索'
            expect(page).to have_link 'CAMP場一覧'
            expect(page).to have_link '掲示板一覧'
            expect(page).to have_no_link 'マイページ'
            expect(page).to have_no_link '掲示板作成'
            expect(page).to have_no_link 'ログアウト'
        end
        scenario '未ログイン時のnavバーの表示' do
            expect(page).to have_no_link "#{@user1.nickname}ログイン中"
            expect(page).to have_link '管理者ログイン'
            expect(page).to have_link 'ユーザー新規登録'
            expect(page).to have_link 'ユーザーログイン'
        end
    end

    feature "Userログイン" do
        scenario 'ログインできる' do
            visit new_user_session_path
            fill_in 'メールアドレス', with: 'user1@camp'
            fill_in 'パスワード', with: '000000'
            click_button 'ログイン', match: :first
            expect(page).to have_content 'ログインしました'
        end
    end

    feature "Userログイン後" do
        before do
            visit new_user_session_path
            fill_in 'メールアドレス', with: 'user1@camp'
            fill_in 'パスワード', with: '000000'
            click_button 'ログイン', match: :first
            visit user_path(@user1)
        end
        scenario 'ログイン後のハンバーガーメニューの表示' do
            expect(page).to have_no_link 'ログイン'
            expect(page).to have_no_link '新規登録'
            expect(page).to have_link 'HOME'
            expect(page).to have_link 'MAPで検索'
            expect(page).to have_link 'CAMP場一覧'
            expect(page).to have_link '掲示板一覧'
            expect(page).to have_link 'マイページ'
            expect(page).to have_link '掲示板作成'
            expect(page).to have_link 'ログアウト'
        end
        scenario 'ログイン後のnavバーの表示' do
            expect(page).to have_content "#{@user1.nickname}ログイン中"
            expect(page).to have_no_link '管理者ログイン'
            expect(page).to have_no_link 'ユーザー新規登録'
            expect(page).to have_no_link 'ユーザーログイン'
        end
        scenario 'マイページでの画像表示' do
            expect(page).to have_selector "img"
        end
        scenario 'マイページでは編集ボタンが表示される' do
            expect(page).to have_content "編集"
        end
        scenario 'マイページではフォローボタンがない' do
            expect(page).to have_no_link "フォロー"
        end
        scenario 'マイページではメールアドレスが表示される' do
            expect(page).to have_content "#{@user1.email}"
        end
    end
    feature "他のユーザーページの場合" do
        before do
            visit new_user_session_path
            fill_in 'メールアドレス', with: 'user1@camp'
            fill_in 'パスワード', with: '000000'
            click_button 'ログイン', match: :first
            visit user_path(@user2)
        end
        scenario '他のユーザー画面では編集ボタンがない' do
            expect(page).to have_no_content "編集"
        end
        scenario '他のユーザー画面ではフォローボタンがある' do
            expect(page).to have_no_link "フォロー"
        end
        scenario '他のユーザー画面ではメールアドレスが表示されない' do
            expect(page).to have_no_content "#{@user1.email}"
        end
    end

end