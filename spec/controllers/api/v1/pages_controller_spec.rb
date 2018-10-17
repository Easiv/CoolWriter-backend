require 'rails_helper'

describe Api::V1::PagesController, type: :controller do
  let!(:book) { create(:book) }
  let!(:page) { create(:page, book: book) }
  let(:body) { JSON.parse(subject.body) }
  #book by default is created with one page so expect having 2 now

  describe 'index' do 
    subject { get :index }

    it 'checks if there are actually 2 pages' do
      expect(body.flatten.length).to eq(2)
    end
  end

  describe 'show' do
    subject { get :show, params: { book: book, id: page.id } }

    it 'gets the page' do
      expect(body['data']['id']).to eq(page.id.to_s)
    end
  end

  describe 'create' do
    let!(:book) { create(:book) }
    let(:page_params) do
      { 
        data: {
          type: 'pages',
          attributes: { 
            content: 'abcdefghijkl'
          },
          relationships: {
            book: { 
              data: {
                id: book.id,
                type: 'books'
              }
            }
          }
        } 
      } 
    end
    
    before do
      request.headers['Content-Type'] = 'application/vnd.api+json'
    end

    subject { post :create, params: page_params }
    it 'returns something' do
      
    end
  end
end
