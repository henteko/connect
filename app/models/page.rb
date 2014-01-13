class Page < Document

  def path
    "/pages/#{page_name}"
  end

  def edit_path
    "#{path}/edit"
  end

  def history_path
    "#{path}/history"
  end
end
