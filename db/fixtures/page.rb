Page.seed do |p|
  p.raw_title = 'home'
  p.raw_body  = 'welcome to connect!'
  p.page_name = 'home'
end
PaperTrail::Version.last.update_column('whodunnit', 1)
