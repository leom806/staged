module ServicesHelper
  def service_status_icon(status)
    case status.to_s
    when 'pending'
      icon 'clock', 'Aguardando', class: 'text-gray-500'
    when 'in_progress'
      icon 'wrench', 'Em Andamento', class: 'text-blue-500'
    when 'done'
      icon 'check-badge', 'Finalizado', class: 'text-green-500'
    when 'canceled'
      icon 'x-circle', 'Cancelado', class: 'text-red-500'
    end
  end

  def service_step_status_icon(status)
    # For now a step has the same status as the service
    # But making room for changes in the future
    service_status_icon(status)
  end
end
