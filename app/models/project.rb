class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user

  def badge_color status
    if status == 'to-do'
      'secondary'
    elsif status == 'in-progress'
      'info'
    elsif status == 'task-done'
      'success'
    end
  end

  def status
    return 'to-do' if tasks.none?
    if tasks.all? { |task| task.complete? }
      'task-done'
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      'in-progress'
    else
      'to-do'
    end
  end

  def percent_complete
    return 0 if tasks.none?
    ((total_complete.to_f / total_tasks) * 100).round
  end

  def total_complete
    tasks.select { |task| task.complete? }.count
  end

  def total_tasks
    tasks.count
  end
end
