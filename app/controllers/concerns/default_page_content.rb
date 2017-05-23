module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Shawn Kearney | Rails Developer'
    @seo_keywords = 'Shawn Kearneys portfolio'
  end
end
