class UsersController < ApplicationController

  skip_before_action :authenticate

  def create
    binding.pry
    user = User.new
  end

end
