class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:edit, :update, :destroy]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      flash[:success] = 'Category created successfully!'
      redirect_to groups_path
    else
      flash.now[:error] = @group.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      flash[:success] = 'Category updated successfully!'
      redirect_to group_purchases_path(@group)
    else
      flash.now[:error] = @group.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @group.destroy
      flash[:success] = 'Category was deleted successfully!'
      redirect_to groups_url
    else
      flash[:error] = @group.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
