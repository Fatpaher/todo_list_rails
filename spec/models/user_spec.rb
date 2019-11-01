require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { should have_many(:todo_lists).class_name('TodoList').dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end
end
