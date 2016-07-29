
class TweetsController < ApplicationController
  def index
    @string = "Hello World"
    @tweets = User.find(params[:user_id]).tweets
    user = User.find(params[:user_id])
    @favorites = current_user.tweet_favorites.where(:id => @tweets)
  end

  def toggle_favorite
     @tweet = Tweet.find(params[:id])
     @favorite = Favorite.where(:user_id => current_user).where(:tweet_id => @tweet).first

    if @favorite
      remove_favorite
      @add_star_class = "fa-star-o"
      @remove_star_class = "fa-star"

   else
     add_favorite
     @add_star_class = "fa-star"
     @remove_star_class = "fa-star-o"
   end
  end

  def all

  end

  def show
   @tweet = Tweet.find(params[:id])

   @favorites = current_user.tweet_favorites.where(:id => @tweet)
  
  end
  
  def favorites
    @tweets = User.find(params[:user_id]).tweet_favorites

    @favorites = current_user.tweet_favorites.where(:id => @tweets)

    render :index
  end

  protected
  def add_favorite
   favorite = Favorite.new
   favorite.user = current_user
   favorite.tweet = @tweet
   favorite.save
   favorite
  end

  def remove_favorite    
    puts @favorite.inspect
    @favorite.destroy
  end

end
