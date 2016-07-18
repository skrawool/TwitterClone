
class TweetsController < ApplicationController
  def index
   @string = "Hello World"
   @tweets = User.find(params[:user_id]).tweets
  end

  def all
  end

  def show
    @tweets = Tweet.find(params[:id])
  end

end
