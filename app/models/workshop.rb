# == Schema Information
#
# Table name: workshops
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  starts_at   :datetime
#  ends_at     :datetime
#  price       :float
#  provider_id :integer
#  image       :string
#  capacity    :integer
#  location    :string
#  reviews     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  other       :string
#

class Workshop < ApplicationRecord
    belongs_to :provider, :class_name => "User"
end
