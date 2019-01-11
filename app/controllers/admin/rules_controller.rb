class Admin::RulesController < Admin::BaseController
  before_action :find_rule, only: %i[update edit]
  before_action :set_rules, only: :index

  def index
  end

  def new
    @rule = Rule.new
  end

  def create
    @rule = Rule.new(rule_params)
    if @rule.save
      redirect_to admin_rules_path, notice: t('.success')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rule.update(rule_params)
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :edit
    end
  end

  private

  def find_rule
    @rule = Rule.find(params[:id])
  end

  def set_rules
    @rules = Rule.all
  end

  def rule_params
    params.require(:rule).permit(:name, :params, :description)
  end
end