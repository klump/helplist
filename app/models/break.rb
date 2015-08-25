class Break < ActiveRecord::Base
  validate :permit_only_one_break

  def self.active?
    Break.any?
  end

  def self.start
    Break.create
  end

  def self.end
    Break.delete_all
  end

  def self.to_json 
    '{"active":' + (Break.active? ? "true" : "false") + '}'
  end

  private
    def permit_only_one_break
      errors.add(:base, "You are already on a break.") if Break.active?
    end
end
