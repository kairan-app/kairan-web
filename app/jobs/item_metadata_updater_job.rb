class ItemMetadataUpdaterJob < ApplicationJob
  queue_as :default

  def perform(item_id)
    Item.find(item_id).update_metadata
  end
end
