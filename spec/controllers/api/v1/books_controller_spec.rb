require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  let!(:book) { create(:book) }

  describe 'index' do
    subject { get :index }

    it 'returns json' do
      body = JSON.parse(subject.body)
      expect(body.length).to eq(1)
    end
  end
  
  describe 'show' do
    subject { get :show, params: { id: book.id } }

    it 'returns book json' do
      formatted_book = JSON.parse subject.body
      expect(formatted_book['data']['id']).to eq(book.id.to_s)
    end
  end

  describe 'create' do
    subject { post :create,
      params: { 
        data: { type: 'books',
          attributes: { 
            author: 'aaa', title: 'bbbbb' 
          } 
        } 
      } 
    }
    it 'maybe creates book' do
      expect(subject.body).to include('bbbbb')
    end
  end

  before do
    request.headers['Content-Type'] = 'application/vnd.api+json'
  end
end