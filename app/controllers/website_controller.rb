class WebsiteController < ApplicationController
  before_action :load_announcement_type, :load_procurement_category, :load_newest_announcements
  def index
    @announcement = Announcement.limit(6).sorted_by_date
    @law_regulations = LawRegulation.all
  end

  def home
  end

  # def contact

  # end

  def show_public_services
    @public_services = PublicService.paginate(:page => params[:page], :per_page => 10)
  end

  def show_question_answer
    @faqs = Faq.all
  end

  def show_contact
    
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
  def show_gdpp_structure
    @org_structures = OrgStructure.all
  end

# order menu
  def show_announcements
    @announcements = Announcement.where(announcement_type_id: params[:type_id], public: true ).sorted_by_date
  end

  def show_announcement
    @announcement = Announcement.find(params[:id])
  end

  def show_procurement_plans
    @procurement_plans = ProcurementPlan.where(procurement_plan_type: params[:type])
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

end
