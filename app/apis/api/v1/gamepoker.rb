module Api  #APIの実装
  module V1
    class GamePoker < Grape::API
      resource :gamepokers do
        params do
          requires :card, type: String, desc: 'ポーカーの手'
        end
        desc 'Return all pokers'
        get do
          GamePoker.all
        end
        
      desc "Judge  a hand."
      params do
        requires :card, type: String, desc: "Your card"
      end
      post do
        GamePoker.create!({
                           card: params[:card],
                           hand: params[:hand],
                           best: params[:best]
                       })
      end
      end
    end
  end
end