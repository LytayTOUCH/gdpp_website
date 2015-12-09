class WebsiteController < ApplicationController
  before_action :load_announcement_type, :load_procurement_category, :load_newest_announcements, :load_law_categories, :load_procurement_methods, :load_org_structure_categories, :load_contact
  def index
    @announcement = Announcement.limit(6).sorted_by_date
    @law_regulations = LawRegulation.limit(4).sorted_by_date
    @image_slides = ImageSlide.all

  end

  def home
  end

  def show_public_services
    @public_services = PublicService.paginate(:page => params[:page], :per_page => 10)
  end

  def show_question_answer
    @faqs = Faq.all
  end
# load_announcement_type, :load_procurement_ca
  def show_contact
    @contact = Contact.first
  end

# Procurement entity
  def show_procurement_entities
    @procurement_entities = ProcurementEntity.where(procurement_category_id: params[:category_id]).paginate(:page => params[:page], :per_page => 16)
  end

  def show_procurement_entity_city_province

  end

  def show_procurement_entity_ministry

  end

  def show_procurement_public_foundation

  end

# Download

  def show_bidder_list_registrative_form

  end

  def show_bidding_document

  end

  def show_planning_approval_correction

  end

# about
  def show_gdpp_role

  end

  def show_quater_years_pfms
    @quater_years_pfms = QuaterYearsPfm.order(title: :desc)
  end

  def show_gdpp_structure
    @org_structures = OrgStructure.all
  end

  def show_purchase_orders
    @purchase_orders = PurchaseOrder.all
  end

# other menus
  def show_announcements
    @announcements = Announcement.where(announcement_type_id: params[:type_id], public: true ).sorted_by_date
  end

  def show_announcement
    @announcement = Announcement.find(params[:id])
  end

  def show_procurement_plans
    @procurement_plans = ProcurementPlan.where(procurement_plan_type: params[:type])
  end

  def show_law_regulation
    @law_regulation = LawRegulation.find(params[:id])
  end

  def show_law_regulations
    @law_category = LawCategory.find(params[:law_category_id])
    @law_regulations = LawRegulation.where(law_category_id: params[:law_category_id])
  end

  def show_awarding_contract
    @awarding_contract = AwardingContract.find(params[:id])
  end

  def show_awarding_contracts
    @procurement_method = ProcurementMethod.find(params[:procurement_method_id])
    @awarding_contracts = AwardingContract.where(procurement_method_id: params[:procurement_method_id])
  end

  def show_org_structures
    @org_structure_category = OrgStructureCategory.find(params[:org_structure_category_id])
    @org_structures = OrgStructure.where(org_structure_category_id: params[:org_structure_category_id])
  end

  def show_org_structure

  end

# Must load all action
  def load_announcement_type
    @announcement_types = AnnouncementType.all
  end

  def load_procurement_category
    @procurement_categories = ProcurementCategory.all
  end

  def load_newest_announcements
    @newest_announcements = Announcement.sorted_by_date.limit(5)
  end

  def load_law_categories
    @law_categories = LawCategory.all
  end

  def load_procurement_methods
    @procurement_methods = ProcurementMethod.all
  end

  def load_org_structure_categories
    @org_structure_categories = OrgStructureCategory.all
  end
  def load_contact
    @contact = Contact.first
  end

end
