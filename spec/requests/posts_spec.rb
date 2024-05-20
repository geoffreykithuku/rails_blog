require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe 'GET /' do
    it 'returns a success response' do
      get '/'
      expect(response).to have_http_status(:success)
    end



end


  end
