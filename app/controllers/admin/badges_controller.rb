class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: :index
<<<<<<< HEAD
<<<<<<< HEAD
  before_action :find_badge, only: %i[destroy show update edit]
=======
  before_action :find_badge, only: %i[destroy show update edit find_rule]
  before_action :find_rule, only: %i[index show]
>>>>>>> 8171ea8... create badges for admin
=======
  before_action :find_badge, only: %i[destroy show update edit]
>>>>>>> a90c91d... refactoring badges for admin

  def index
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

  def set_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

<<<<<<< HEAD
<<<<<<< HEAD
=======
  def find_rule
    @rule = Rule.find(id = @badge.id)
  end

>>>>>>> 8171ea8... create badges for admin
=======
>>>>>>> a90c91d... refactoring badges for admin
  def badge_params
    params.require(:badge).permit(:name, :route, :rule_id)
  end
end