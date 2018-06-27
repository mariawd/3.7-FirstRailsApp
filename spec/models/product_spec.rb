require 'rails_helper'

describe Product do
  let(:product) { Product.create!(name: "race bike", description: "x", price: 10, colour: "x") }
  let (:user) {User.create!(first_name: "Maria", last_name:"Robles", email: "mariarobleshottel@gmail.com", password: "mari08")}

  before do
    product.comments.create!(rating: 1, user: user, body: "Awful bike!")
    product.comments.create!(rating: 3, user: user, body: "Ok bike!")
    product.comments.create!(rating: 5, user: user, body: "Great bike!")
  end

  it "returns the average rating of all comments" do
   expect(product.average_rating).to eq 3
  end

  it "is not valid without a name" do
    expect(Product.new(description: "Nice Bike")).not_to be_valid
  end

end
