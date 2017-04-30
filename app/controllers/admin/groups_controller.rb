class Admin::GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_group_and_check_permission, only: [:update, :edit, :destroy]
  before_action :require_is_admin

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      redirect_to admin_groups_path
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @group.update(group_params)
      redirect_to admin_groups_path
    else
      render :edit
    end
  end

  def destroy


    @group.destroy

    redirect_to admin_groups_path
  end

  private
  def find_group_and_check_permission
    @group = Group.find(params[:id])

    if current_user != @group.user
      redirect_to admin_groups_path, alert: "只有群组创建者，才能修改哦"
    end
  end

  def group_params
    params.require(:group).permit(:title, :description, :description2, :user_id)
  end

end
