class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(:created_at).reverse_order
  end

  def new
    @tweet = Tweet.new
  end
  
	def create
		@tweet = Tweet.new(tweet_params)
		respond_to do |format|
			if @tweet.save!
			format.js {render nothing: true, notice: 'Re weno el tweet'}
			end
		end
	end
  
	def show
		@tweet = Tweet.find(params[:id])
	end

	def edit
		@tweet = Tweet.find(params[:id])
	end

	def update
		@tweet = Tweet.find(params[:id])
		respond_to do |format|
			if @tweet.update!(tweet_params)
				format.js {render layout: false, notice: 'Re weno el cambio del tweet'}
			end	
		end
	end

	def destroy
		@tweet = Tweet.find(params[:id])
		respond_to do |format|
			if @tweet.destroy!
				format.js {render layout: false, notice: 'lo re borraste'}
			end
		end
	end
	
	private

	def tweet_params
		params.require(:tweet).permit(:content, :title)
	end
  
end
