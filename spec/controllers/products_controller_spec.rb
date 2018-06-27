require 'rails_helper'

  describe ProductsController, type: :controller do

    context "GET #index" do
      it 'renders the index page' do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end
    end

    context "GET #new" do
      it 'renders the new page' do
        get :new
        expect(response).to be_ok
        expect(response).to render_template('new')
      end
    end

    context "GET #edit" do
      before do
        @product = Product.create(name: "Testing Bike Berlin", description: "test", colour: "red", price: 100)
      end
    end

    context "GET #show" do
      before do
        @product = Product.create(name: "Testing Bike Berlin", description: "test", colour: "red", price: 100)
      end
      it 'renders the show page' do
        get :show, params: {id: @product.id}
        expect(response).to be_ok
        expect(response).to render_template('show')
      end
    end

    context "POST #create" do
      before do
        @user = FactoryBot.create(:user)
      end
    end

    context "POST #update" do
      before do
        @product = Product.create(name: "Testing Bike Berlin", description: "test", colour: "red", price: 100)
      end
    end

    context "DELETE #destroy" do
      before do
        @product = Product.create(name: "Test", description: "test", colour: "red", price: 100)
      end
    end

end
