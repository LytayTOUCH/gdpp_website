class WebsiteController < ApplicationController
  before_action :load_announcement_type
  def index
    @announcement = Announcement.limit(6).sorted_by_date
    @law_regulations = LawRegulation.all
  end

  def home
  end

  # def contact

  # end

  def show_public_service
    
  end

  def show_question_answer
    @faqs = Faq.all
  end

  def show_contact
    
  end

# Procurement entity

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


  private
    def load_announcement_type
      @announcement_types = AnnouncementType.all
    end  

end
