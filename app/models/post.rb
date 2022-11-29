class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait?

    CLICKBAIT_WORDS = [/Won't Believe/,  /Secret/,  /Top [0-9]/, /Guess/]
    def clickbait?
        if CLICKBAIT_WORDS.none? { |word| word.match title}
            errors.add(:title, "Must be clickbait")
        end
    end
end
