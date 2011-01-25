  class TopicsOfferingsJoinTable < ActiveRecord::Migration
    def self.up
      create_table :offerings_topics, :id => false do |t|
        t.integer :offering_id
        t.integer :topic_id
      end
    end

    def self.down
      drop_table :offerings_topics
    end
  end

