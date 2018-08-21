class Api::V1::UserGroupsController < ApplicationController



  def destroy
    debugger
    @user_group = UserGroup.find(params[:id])
    @user_group.destroy


  end

end
