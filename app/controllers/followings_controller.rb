# frozen_string_literal: true

class FollowingsController < ApplicationController
  def index
    @title = t('views.common.Followings')
    @user  = User.find(params[:user_id])
    @users = @user.followings.page(params[:page])
  end
end
