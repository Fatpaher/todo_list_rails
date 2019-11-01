require 'rails_helper'

RSpec.describe Task do
  describe 'associations' do
    it { is_expected.to belong_to(:todo_list).class_name('TodoList') }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
  end
end
