module RedmineAutoPercent
  module IssuePatch
    def self.included(base)
      base.extend(ClassMethods)

      base.send(:include, InstanceMethods)

      base.class_eval do
        before_save :update_percent
      end
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def update_percent
      self.done_ratio = 100 if self.status_id == 3 || self.status_id == 5
    end
  end
end
