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
    procurement_category = ProcurementCategory.find_by(name: params[:name])
    @procurement_entities = ProcurementEntity.where(procurement_category_id: procurement_category.id).paginate(:page => params[:page], :per_page => 16)
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


  def show_gdpp_structure
    @org_structures = OrgStructure.all
  end

  def show_purchase_orders
    @purchase_orders = PurchaseOrder.all
  end

# other menus
  def show_announcements
    announcement_type = AnnouncementType.find_by(name: params[:name])
    @announcements = Announcement.where(announcement_type_id: announcement_type.id, publish: true ).sorted_by_date
  end

  def show_announcement
    @announcement = Announcement.find(params[:id])
  end

  def show_procurement_plans
    if !params[:name].eql?('ផែនការលទ្ធកម្មដើមឆ្នាំ')
      @procurement_plans = ProcurementPlan.where(procurement_plan_type: 'annual')
    else
      @procurement_plans = ProcurementPlan.where(procurement_plan_type: 'adjusted')
    end
  end

  def show_law_regulation
    @law_regulation = LawRegulation.find(params[:id])
  end

  def show_law_regulations_by_name
    lc = LawCategory.find_by(name: params[:name])
    # @law_regulation = LawRegulation.find(LawCategory.find_by(name: params[:name]).id)
    @name = params[:name]
    @law_regulations = lc.law_regulations
  end

  def show_law_regulations
    @law_category = LawCategory.find(params[:law_category_id])
    @law_regulations = LawRegulation.where(law_category_id: params[:law_category_id])
  end

  def show_awarding_contract
    @awarding_contract = AwardingContract.find(params[:id])
  end

  def show_awarding_contracts
    procurement_method = ProcurementMethod.find_by(name: params[:name])
    @awarding_contracts = AwardingContract.where(procurement_method_id: procurement_method.id)
  end

  def show_org_structures
    @org_structure_category = OrgStructureCategory.find_by(name: params[:name])
    @org_structures = OrgStructure.where(org_structure_category_id: @org_structure_category.id)
  end

  def show_org_structure

  end

  def show_conflict

  end

  def show_pfm_attachements
    @pfm_attachmetns = QuaterYearsPfm.order(title: :desc)
    # @semester_year_pmfs = SemesterYearPmf.all.order("year DESC")
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
