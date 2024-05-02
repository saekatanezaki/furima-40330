require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      user = User.new(name: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(name: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
    end

    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '000000')
      user.valid?
    end

    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '000000')
      user.valid?
    end

    it 'password_confirmationが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '')
      user.valid?
    end

  end
end
