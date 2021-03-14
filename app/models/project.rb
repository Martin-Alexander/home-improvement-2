class Project < ApplicationRecord
  STATUS_CREATED   = "created"
  STATUS_STARTED   = "started"
  STATUS_STOPPED   = "stopped"
  STATUS_COMPLETED = "completed"
  STATUSES = [STATUS_CREATED, STATUS_STARTED, STATUS_STOPPED, STATUS_COMPLETED]

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_presence_of(
    :title,
    :description,
    :status,
    :estimated_level_of_effort,
    :actual_level_of_effort
  )

  validates :status, inclusion: { in: STATUSES }
  validates :actual_level_of_effort, inclusion:    { in: (1..10).to_a }
  validates :estimated_level_of_effort, inclusion: { in: (1..10).to_a }

  scope :publicly_visable, ->() { where(private: false) }

  def public?
    !private
  end

  def private?
    private
  end

  def completed?
    status == STATUS_COMPLETED
  end
end
