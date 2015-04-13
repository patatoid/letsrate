class RaterController < ApplicationController

  def create
    if user_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_i, current_user, params[:dimension]

      render :json => true
    else
      render :json => false
    end
  end

  def toggle_published
    @rate = Rate.find(params[:id])
    if @rate.update(published: !@rate.published)
      flash[:notice] = 'Modification effectuée'
    else
      flash[:warning] = 'Une erreur s\'est produite'
    end
    redirect_to :back
  end

end
