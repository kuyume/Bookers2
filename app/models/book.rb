class Book < ApplicationRecord
    validates :title, presence: true
    
    validate :add_error
    
    def add_error
        # nameが空のときにエラーメッセージを追加する
        if imp.blank?
            errors[:base] << "Impression can't be blank"
        end
        if imp.length > 200
            errors[:base] << "Impression is too long(maximum is 200 characters)"
        end
    end

    
    belongs_to :user
end
