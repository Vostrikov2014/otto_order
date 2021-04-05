require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  let(:client) { create(:client) }

  describe 'GET #index' do
    let(:clients) { create_list(:client, 3) }
    before { get :index }

    it 'populates an array of all clients' do
      expect(assigns(:clients)).to match_array(clients)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: client } }

    it 'assigns the requested wallet to @client' do
      expect(assigns(:client)).to eq client
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Client to @client' do
      expect(assigns(:client)).to be_a_new(Client)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: client } }

    it 'assigns the requested client to @client' do
      expect(assigns(:client)).to eq client
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'attributes valid' do
      it 'client saves in database' do
        expect { post :create, params: { client: attributes_for(:client) } }.to change(Client, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { client: attributes_for(:client) }
        expect(response).to redirect_to assigns(:client)
      end
    end

    context 'attributes invalid' do
      it 'currency not saved' do
        expect { post :create, params: { client: attributes_for(:client, :invalid) } }.to_not change(Client, :count)
      end

      it 're-renders new view' do
        post :create, params: { client: attributes_for(:client, :invalid) }
        expect(response).to render_template :new
      end
    end
  end
end
