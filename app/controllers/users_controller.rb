class UsersController < ApplicationController

    def create()
        User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], age: params[:age], description: params[:description], city_id: params[:city_id], password_digest: params[:password_digest], password_confirmation: params[:password_digest])
    end

    def show()
        id = params[:id]
        @user = User.find(id)
    end

end