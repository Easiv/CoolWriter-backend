require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  let!(:book) { create(:book) }

  describe 'index' do
    subject { get :index }

    it 'checks if there is actually only one book' do
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
    let(:book_params) do
      { 
        data: {
          type: 'books',
          attributes: { 
            author: 'aaa',
            title: 'bbbbb' 
          }
        } 
      } 
    end

    before do
      request.headers['Content-Type'] = 'application/vnd.api+json'
    end

    subject { post :create, params: book_params }

    it 'creates book with specific params' do
      formatted_book = JSON.parse(subject.body)

      expect(formatted_book['data']['attributes']['author']).to eq('aaa')
      expect(formatted_book['data']['attributes']['title']).to eq('bbbbb')
    end
  end

  describe 'update' do
    let(:nil_book) { create(:book, description: 'nothing') }
    subject { patch :update, params: { description: 'something' } }
    it 'updates description of the book' do
      subject
      binding.pry
    end
  end
end