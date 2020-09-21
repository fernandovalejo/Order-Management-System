require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before(:each) do 
    create(:status_pending)
    create(:status_in_progress)
    create(:status_completed)
    create(:order_pending)
    create(:order_in_progress)
    create(:order_completed)
  end

  context "GET #index" do

    it 'Without Params' do 
      get :index
      expect(response.status).to eq(200)
    end

    it 'With Status Params' do 
      get :index, params: {status_id: Status.order(Arel.sql('RANDOM()')).first.id}
      expect(response.status).to eq(200)
    end

    it 'With Status Params' do 
      get :index, params: {control_number: Order.order(Arel.sql('RANDOM()')).first.control_number}
      expect(response.status).to eq(200)
    end
  end

  context "POST #create" do
    let!(:order) { create(:order_pending) }

    it 'create a new order' do
      orders_params = attributes_for(:order_pending)

      expect{
        post :create, params: {order: orders_params}
      }.to change(Order, :count).by(1)
      expect(flash[:notice]).to eq('Order was successfully created.')
    end

    it 'not create a new order' do
      orders_params = { control_number: DateTime.now.strftime("%Y%m%d%H%M%S%L") }
      post :create, params: { order: orders_params }
      expect(response).to render_template('new')
    end
  end

  context "GET #show" do
    it 'valid order' do
      get :show, params: { id: Order.order(Arel.sql('RANDOM()')).first}
      expect(response).to render_template(:show)
    end
  end
end