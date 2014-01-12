class Blog < Document
  has_many :comments

  def path
    "/#{user.username}/#{id}"
  end

  def edit_path
    "#{path}/edit"
  end

  def history_path
    "#{path}/history"
  end
end
