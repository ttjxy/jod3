class Admin::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  before_action :find_post_and_check_permission, only: [:update, :edit, :destroy]
  
  def show
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
  end

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @post.update(post_params)
      redirect_to group_path(@group), notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy

    @post.destroy
    redirect_to group_path(@group)
  end


  private
  def find_post_and_check_permission
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])

    if current_user != @post.user
      redirect_to group_path(@group), alert: "只有ORID创建者，才能修改哦"
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :content2, :content3, :content4)
  end
end
