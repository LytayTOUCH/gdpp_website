class AdministratorController < ApplicationController
  before_action :authenticate_admin!
  layout 'administrator'

  def index
    @announcements = Announcement.all
    @law_regulations = LawRegulation.all
    @faqs = Faq.all
    @budget_sources = BudgetSource.all
    @procurement_entities = ProcurementEntity.all
  end

end