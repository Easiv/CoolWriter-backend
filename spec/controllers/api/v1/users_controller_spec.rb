require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  let!(:user) { create(:user) }
  let(:body) { JSON.parse(subject.body) }

  describe 'index' do
    subject { get :index }

    it 'checks if there is a user' do
      expect(body.length).to eq(1)
    end
  end

    describe 'show' do
      subject { get :show, params: { id: user.id } }

      it 'returns requested user' do
        expect(body['data']['id']).to eq(user.id.to_s)
      end
    end

    describe 'create' do
      let(:user_params) do
        { 
          data: {
            type: 'users',
            attributes: {
              name: 'Woooooot',
              email: 'nice@angery.sigh'
            }
          }
        }
      end

      before do
        request.headers['Content-Type'] = 'application/vnd.api+json'
      end

      subject { post :create, params: user_params }

      it 'returns 2 users' do
        subject
        expect(User.all.length).to eq(2)
      end
    end

    describe 'update' do
      let(:user_params) do
        {
          id: user.id,
          type: 'users',
          attributes: {
            name: 'luuuul',
            email: 'ciamciaramcia@pupa.pl'
          }
        }
      end

      before do
        request.headers['Content-Type'] = 'application/vnd.api+json'
      end

      subject { patch :update, params: { id: user.id, data: user_params } }
      it 'checks if attributes matches' do
        subject
        expect(user.reload.name).to eq('luuuul');
        expect(user.reload.email).to eq('ciamciaramcia@pupa.pl');
      end
    end

    describe 'destroy' do
      subject { delete :destroy, params: { id: user.id } }

      it 'removes the user' do
        expect { subject }.to change(User, :count).by(-1)
      end
    end
  end


