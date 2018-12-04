module Api
  module V1
    class TweetsController < Api::V1::ApiController
      before_action :set_current_user
      before_action :set_tweet, except: %i[create index]
      before_action :authenticate_user, except: %i[show create]
      load_and_authorize_resource except: %i[index show create]

      def index
        user = User.find params[:user_id]
        @tweets = user.tweets.paginate(page: params[:page] || 1)
        render json: @tweets
      end

      def create
        @tweet = Tweet.new(tweet_params.merge(user: current_user))

        if @tweet.save
          render json: @tweet, status: :created
        else
          render json: @tweet.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: @tweet, include: '**'
      end

      def destroy
        @tweet.destroy
      end

      def update
        if @tweet.update(tweet_params.merge(user: current_user))
          render json: @tweet
        else
          render json: @tweet.errors, status: :unprocessable_entity
        end
      end

      private

      def set_tweet
        @tweet = Tweet.find(params[:id])
      end

      def tweet_params
        params.require(:tweet).permit(:body, :tweet_original_id)
      end

      def set_current_user
        @current_user = current_user || nil
      end
    end
  end
end
