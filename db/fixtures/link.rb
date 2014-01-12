links = [
  { title: 'Gmail',           url: 'https://mail.google.com/' },
  { title: 'Google Calendar', url: 'https://www.google.com/calendar' },
  { title: 'HipChat',         url: 'https://www.hipchat.com/' },
  { title: 'GitHub',          url: 'https://github.com/' },
  { title: 'Pivotal Tracker', url: 'https://www.pivotaltracker.com/' }
]

links.each do |link|
  Link.seed do |l|
    l.title = link[:title]
    l.url   = link[:url]
  end
end
