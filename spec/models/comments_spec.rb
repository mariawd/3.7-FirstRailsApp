require 'rails_helper'

describe Comment do

   before(:each) do
    @product = Product.create(name: "Test Bike", description: "Test", colour: "white", price: 100)
    @user = FactoryBot.create(:user)
  end

  context "If comment does not have all attributes" do
    let(:comment) {Comment.new(user_id: 1, product_id: @product.id, body: "Very good!", rating: nil)}

    it 'it is invalid' do
      expect(Comment.new(user_id: 1, product_id: @product.id, body: "Very good!", rating: nil)).not_to be_valid
    end
  end
end
