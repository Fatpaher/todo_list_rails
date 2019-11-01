require 'rails_helper'

RSpec.describe TodoList do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end
end
