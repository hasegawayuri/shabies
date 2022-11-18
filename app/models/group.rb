class Group < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :tag, optional: true
    belongs_to :classification
    has_many :members
    has_many :gpins
    has_many :boards
    validate :error_check

    def error_check
        if groupname.blank?
            errors[:base] << 'グループ名は必ず入力してください'
        end
        if limit < 5
            errors[:base] << '人数制限は５人以上で設定してください'
        end
    end
end
