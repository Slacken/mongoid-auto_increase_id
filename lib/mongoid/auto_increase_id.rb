require "mongoid/auto_increase_id/version"

module Mongoid
  module AutoIncreaseId
    extend ActiveSupport::Concern
    included do
      field :_id, type: Integer
      before_create do |document|
        document.id = document.generate_id
      end
    end

    def generate_id
      o = Mongoid::Sessions.default.command({:findAndModify => "mongoid.auto_increment_ids",
        :query  => { :_id => collection_name.to_s },
        :update => { "$inc" => { :c => 1 } },
        :upsert => true,
        :new    => true })
      o["value"]["c"].to_i
    end

    def reset_id_counter
      Mongoid::Sessions.default.command({:findAndModify => "mongoid.auto_increment_ids",
        :query  => { :_id => collection_name.to_s },
        :update => { "$set" => { :c => 0 } }
        })
    end

    def max_id
      o = Mongoid::Sessions.default["mongoid.auto_increment_ids"].where(_id: collection_name.to_s).find.first
      o.nil? ? 0 : o[:c]
    end
  end
end
