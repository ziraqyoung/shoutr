class ShoutSearchQuery
  def initialize(term:)
    @term = term
  end

  def to_relation
    matching_shouts_for_text_shouts.or(matching_shouts_for_photo_shouts)
  end

  private

    attr_reader :term

    def matching_shouts_for_text_shouts
      Shout.where(content_type: "TextShout", content_id: matching_text_shouts.ids)
    end

    def matching_text_shouts
      TextShout.where("body ILIKE ?", "%#{term}%")
    end

    def matching_shouts_for_photo_shouts
      Shout.where(content_type: "PhotoShout", content_id: matching_photo_shouts.ids)
    end

    def matching_photo_shouts
      # this might need refactoring ()
      PhotoShout.joins(:image_attachment).joins(:image_blob).where("active_storage_blobs.filename ILIKE ?", "%#{term}%")
    end
end
