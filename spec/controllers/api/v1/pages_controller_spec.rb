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
    let(:body) { JSON.parse(subject.body) }
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

    it 'has 2 pages' do
      expect(book.pages.length).to eq(2)
    end
    
    before do
      request.headers['Content-Type'] = 'application/vnd.api+json'
    end

    subject { post :create, params: page_params }

    it 'added a third page' do
      subject
      expect(book.pages.length).to eq(3)
    end
  end

  describe 'update' do
    let(:body) { JSON.parse(subject.body) }
    let(:page_params) do
      {
          id: page.id,
          attributes: {
            content: 'abcdefghijkl'
          },
          type: 'pages'
      }
    end

    before do
      request.headers['Content-Type'] = 'application/vnd.api+json'
    end

    subject { patch :update, params: { id: page.id, data: page_params } }

    it 'should update the content' do
      subject
      expect(body['data']['attributes']['content']).to eq(page.reload.content)
    end
  end

  describe 'destroy' do
    let!(:pag) { create(:page, book: book) }
    subject { delete :destroy, params: { id: pag.id } }

    it 'removes the pag' do
      expect { subject }.to change(Page, :count).by(-1)
    end
  end
end
