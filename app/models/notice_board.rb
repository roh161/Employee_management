class NoticeBoard < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["content", "created_at", "date", "id", "subject", "updated_at"]
    end

    validates :subject, :content, :date, presence:true
end
