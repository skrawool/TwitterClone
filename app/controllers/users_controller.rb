class UsersController < ApplicationController
def index

  @tweets = current_user.tweets
end

def all

end

def show

end
