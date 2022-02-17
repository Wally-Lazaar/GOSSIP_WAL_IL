class GreetsController < ApplicationController
  def greet
    @first_name = params[:first_name]
  end
end
