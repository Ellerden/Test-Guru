class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[destroy show update edit]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success')
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :edit
    end
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :image_path, :description, :rule_name, :rule_params)
  end
end