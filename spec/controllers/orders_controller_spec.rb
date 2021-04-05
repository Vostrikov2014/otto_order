require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:order) { create(:order) }

  describe 'GET #index' do
    let(:orders) { create_list(:order, 3) }
    before { get :index }

    it 'populates an array of all orders' do
      expect(assigns(:orders)).to match_array(orders)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: order } }

    it 'assigns the requested order to @order' do
      expect(assigns(:order)).to eq order
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new order to @order' do
      expect(assigns(:order)).to be_a_new(Order)
    end

    it 'assigns a new order to @order' do
      expect(assigns(:order).client).to be_a_new(Client)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: order } }

    it 'assigns the requested order to @order' do
      expect(assigns(:order)).to eq order
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'attributes valid' do
      it 'order saves in database' do
        expect { post :create, params: { order: attributes_for(:order) } }.to change(Order, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { order: attributes_for(:order) }
        expect(response).to redirect_to assigns(:order)
      end
    end

    context 'attributes invalid' do
      it 'currency not saved' do
        expect { post :create, params: { order: attributes_for(:order, :invalid) } }.to_not change(Order, :count)
      end

      it 're-renders new view' do
        post :create, params: { order: attributes_for(:order, :invalid) }
        expect(response).to render_template :new
      end
    end
  end
end
