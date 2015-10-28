class Announcement < ActiveRecord::Base
  belongs_to :announcement_type
  belongs_to :procurement_entity
  belongs_to :budget_source

  validates :title, presence: true
  validates :description, presence: true
  validates :announcement_type_id, presence: true
  validates :procurement_entity_id, presence: true
  validates :budget_source_id, presence: true
  validates :open_register_date, presence: true
  validates :close_submit_date, presence: true
  validates :open_bid_doc_date, presence: true

end
