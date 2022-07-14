# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sauna, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it '有効な投稿内容の場合は保存されるか' do
      expect(FactoryBot.build(:sauna)).to be_valid
    end
  end

  context '空白のバリデーションチェック' do
    it 'nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: '', postcode: '0000000', address: 'hoge', tel: '00000000000', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:name]).to include("が入力されていません。")
    end
    it 'postcodeが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '', address: 'hoge', tel: '00000000000', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:postcode]).to include("が入力されていません。")
    end
    it 'addressが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '0000000', address: '', tel: '00000000000', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:address]).to include("が入力されていません。")
    end
    it 'telが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '0000000', address: 'hoge', tel: '', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:tel]).to include("が入力されていません。")
    end
    it 'hpが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '0000000', address: 'hoge', tel: '00000000000', hp: '', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:hp]).to include("が入力されていません。")
    end
    it 'accessが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '0000000', address: 'hoge', tel: '00000000000', hp: 'hoge', access: '', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:access]).to include("が入力されていません。")
    end
    it 'holidayが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: '', postcode: '0000000', address: 'hoge', tel: '00000000000', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:name]).to include("が入力されていません。")
    end
    it 'openが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '0000000', address: 'hoge', tel: '00000000000', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: '', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:open]).to include("が入力されていません。")
    end
    it 'feeが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '0000000', address: 'hoge', tel: '00000000000', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: '', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:fee]).to include("が入力されていません。")
    end
    it 'sauna_temperatureが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '0000000', address: 'hoge', tel: '00000000000', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:sauna_temperature]).to include("が入力されていません。")
    end
    it 'sauna_capacityが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '0000000', address: 'hoge', tel: '00000000000', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '', mizu_temperature: '10', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:sauna_capacity]).to include("が入力されていません。")
    end
    it 'mizu_temperatureが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '0000000', address: 'hoge', tel: '00000000000', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '', mizu_capacity: '5', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:mizu_temperature]).to include("が入力されていません。")
    end
    it 'mizu_capacityが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '0000000', address: 'hoge', tel: '00000000000', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '', depth: '100')
      expect(sauna).to be_invalid
      expect(sauna.errors[:mizu_capacity]).to include("が入力されていません。")
    end
    it 'depthが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      sauna = Sauna.new(name: 'hoge', postcode: '0000000', address: 'hoge', tel: '00000000000', hp: 'hoge', access: 'hoge', holiday: 'hoge', open: 'hoge', fee: 'hoge', sauna_temperature: '100', sauna_capacity: '10', mizu_temperature: '10', mizu_capacity: '5', depth: '')
      expect(sauna).to be_invalid
      expect(sauna.errors[:depth]).to include("が入力されていません。")
    end
  end
end