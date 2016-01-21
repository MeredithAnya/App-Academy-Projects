# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'

  has_many :responses,
    through: :answer_choices,
    source: :responses
end
