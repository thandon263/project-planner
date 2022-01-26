class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: ['to-do', 'in-progress', 'task-done']}
  
  STATUS_OPTIONS = [
    ['To Do', 'to-do'], 
    ['In Progress', 'in-progress'], 
    ['Task Done', 'task-done']
  ]
  
  def badge_color
    case status
    when 'to-do'
        'secondary'
    when 'in-progress'
        'info'
    when 'task-done'
        'success'
    end
  end
  

  def complete?
    status == 'task-done'
  end

  def in_progress?
    status == 'in-progress'
  end

  def todo?
    status == 'to-do'
  end
end
