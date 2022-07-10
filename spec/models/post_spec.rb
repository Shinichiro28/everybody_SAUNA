# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it '有効な投稿内容の場合は保存されるか' do
      expect(FactoryBot.build(:post)).to be_valid
    end
  end

  context '空白のバリデーションチェック' do
    it 'sauna_minutesが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      post = Post.new(sauna_minutes: '', mizu_minutes: '1.5', totonoi_minutes: '10', sauna_times: '3', sauna_temperature: '100', mizu_temperature: '10', sauna_post: 'hoge', food_name: 'hoge', food_post: 'hoge')
      expect(post).to be_invalid
      expect(post.errors[:sauna_minutes]).to include("が入力されていません。")
    end
    it 'mizu_minutesが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      post = Post.new(sauna_minutes: '10', mizu_minutes: '', totonoi_minutes: '10', sauna_times: '3', sauna_temperature: '100', mizu_temperature: '10', sauna_post: 'hoge', food_name: 'hoge', food_post: 'hoge')
      expect(post).to be_invalid
      expect(post.errors[:mizu_minutes]).to include("が入力されていません。")
    end
    it 'totonoi_minutesが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      post = Post.new(sauna_minutes: '10', mizu_minutes: '1.5', totonoi_minutes: '', sauna_times: '3', sauna_temperature: '100', mizu_temperature: '10', sauna_post: 'hoge', food_name: 'hoge', food_post: 'hoge')
      expect(post).to be_invalid
      expect(post.errors[:totonoi_minutes]).to include("が入力されていません。")
    end
    it 'sauna_timesが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      post = Post.new(sauna_minutes: '10', mizu_minutes: '1.5', totonoi_minutes: '10', sauna_times: '', sauna_temperature: '100', mizu_temperature: '10', sauna_post: 'hoge', food_name: 'hoge', food_post: 'hoge')
      expect(post).to be_invalid
      expect(post.errors[:sauna_times]).to include("が入力されていません。")
    end
    it 'sauna_temperatureが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      post = Post.new(sauna_minutes: '10', mizu_minutes: '1.5', totonoi_minutes: '10', sauna_times: '3', sauna_temperature: '', mizu_temperature: '10', sauna_post: 'hoge', food_name: 'hoge', food_post: 'hoge')
      expect(post).to be_invalid
      expect(post.errors[:sauna_temperature]).to include("が入力されていません。")
    end
    it 'mizu_temperatureが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      post = Post.new(sauna_minutes: '10', mizu_minutes: '1.5', totonoi_minutes: '10', sauna_times: '3', sauna_temperature: '100', mizu_temperature: '', sauna_post: 'hoge', food_name: 'hoge', food_post: 'hoge')
      expect(post).to be_invalid
      expect(post.errors[:mizu_temperature]).to include("が入力されていません。")
    end
    it 'sauna_postが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      post = Post.new(sauna_minutes: '10', mizu_minutes: '1.5', totonoi_minutes: '10', sauna_times: '3', sauna_temperature: '100', mizu_temperature: '10', sauna_post: '', food_name: 'hoge', food_post: 'hoge')
      expect(post).to be_invalid
      expect(post.errors[:sauna_post]).to include("が入力されていません。")
    end
  end
end