module ContactsHelper
  def check_contact_available(contact)
    contact.present? ? contact : "N/A"
  end
end
