module API
  module V1
    class Root < Grape::API
      # http://localhost:3000/api/v1/
      version 'v1', using: :path
      format :json
      default_format :json
      prefix :api

      mount API::V1::GamePoker
      
      # 404NotFoundの扱い
      route :any, '*path' do
        error! I18n.t('grape.errors.not_found'), 404
      end

    end
  end
end