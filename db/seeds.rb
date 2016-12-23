Composer.destroy_all
Work.destroy_all
Edition.destroy_all

composers = [
  { first_name: 'Johannes', last_name: 'Brahms' },
  { first_name: 'Claude', last_name: 'Debussy' },
]

Composer.create!(composers)

works = [
  { title: 'Sonata for Cello and Piano in F Major' },
  { title: 'String Quartet' },
]

Work.create!(works)

editions = [
  { description: 'Facsimilie', publisher: 'Black Music House', year: 1998, price: 21.95 },
  { description: 'Urtext', publisher: 'RubyTunes', year: 1977, price: 17.99 },
  { description: 'Ed. Y.Matsumo', publisher: 'RubyTunes', year: 2001, price: 23.50 },
  { description: '', publisher: 'Black Music House', year: 1995, price: 39.95 },
  { description: 'Reprint', publisher: 'RubyTunes', year: 2011, price: 31.99 },
]

Edition.create!(editions)

brahms = Composer.where(last_name: 'Brahms').first
debussy = Composer.where(last_name: 'Debussy').first

sonata = Work.where(works[0]).first
strings = Work.where(works[1]).first

brahms.works << sonata
debussy.works << strings

Edition.all.map.with_index do |edition, idx|
  if idx % 2 == 0
    sonata.editions << edition
  else
    strings.editions << edition
  end
end
