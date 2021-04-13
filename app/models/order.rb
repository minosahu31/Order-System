class Order < ApplicationRecord
  belongs_to :user
  validates :phone, :presence => { :message => "Only positive number without spaces are allowed!" },
                    :numericality => true,
                    :length => { :minimum => 10, :maximum => 15 }
  validates :amount, :presence => { :message => "Only positive number without spaces are allowed!" },
                     :numericality => true
end
