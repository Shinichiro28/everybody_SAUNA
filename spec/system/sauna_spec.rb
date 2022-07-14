# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '投稿のテスト', type: :system do

  describe '投稿画面(new_sauna_path)のテスト', type: :system do
    before do
      sign_in saunner
      visit new_sauna_path
    end

    context '表示の確認' do
      it 'new_sauna_pathが"/saunas/new"であるか' do
        expect(current_path).to eq('/saunas/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿'
      end
    end

    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'coordinate[title]', with: Faker::Lorem.characters(number: 5)
        fill_in 'coordinate[body]', with: Faker::Lorem.characters(number: 20)
        select "カジュアル", from: "coordinate_dress_code"
        select "春", from: "coordinate_season"
        select "10度以下(寒い)", from: "coordinate_temperature"

        attach_file("coordinate_coordinate_image", "app/assets/images/non-item.jpg")
        click_button '投稿'
        expect(page).to have_current_path saunas_path(Sauna.last)
      end
    end
  end
end