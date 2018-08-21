class Api::V1::UserGroupsController < ApplicationController



  def destroy
    @user_group = UserGroup.find(params[:id])
    @user_group.destroy


  end

end
