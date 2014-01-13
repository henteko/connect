class Page < Document

  class << self
    def find_by_page_names(page_names)
      where_page_names(page_names).last
    end

    def where_page_names(page_names)
      pages = []
      page_names = page_names.split('/').reverse
      page_names.each_with_index do |page_name, i|
        parent_page = Page.find_by_page_name(page_names[i + 1])
        page = Page.find_by(page_name: page_name, parent_page_id: parent_page.try(:id))
        return [] unless page
        pages << page
      end
      pages.reverse
    end
  end

  def child_pages
    Page.where(parent_page_id: id)
  end

  def path
    page_names = []
    page_names << page_name
    _parent_page_id = parent_page_id
    while _parent_page_id do
      page = Page.find_by_id(_parent_page_id)
      page_names << page.page_name
      _parent_page_id = page.parent_page_id
    end
    "/pages/#{page_names.reverse.join('/')}"
  end

  def edit_path
    "#{path}/edit"
  end

  def history_path
    "#{path}/history"
  end
end
