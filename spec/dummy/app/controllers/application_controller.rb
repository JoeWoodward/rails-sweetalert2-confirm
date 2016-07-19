class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def show
    redirect_to root_path, notice: 'Showing'
  end

  def index
  end

  def destroy
    unless request.xhr?
      redirect_to root_path, notice: 'Destroyed'
    end
    respond_to do |format|
      format.js {}
    end
  end
end
