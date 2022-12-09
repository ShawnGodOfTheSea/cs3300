require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = Factory.build(:user)
  end
end
