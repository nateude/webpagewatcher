module ReportsHelper
  def status_names
    status_arry = ['scheduled','started','pending','completed','canceled','error']
  end
  def status_name(status)
    status_names[status.to_f]
  end
end
