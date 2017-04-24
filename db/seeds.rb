Composer.destroy_all
Work.destroy_all
Edition.destroy_all

composers = [
  { first_name: 'Johannes', last_name: 'Brahms' },
  { first_name: 'Claude', last_name: 'Debussy' },
]

Composer.create!(composers)

works = [
  { title: 'Sonata for Cello and Piano in F Major', year: 1965 },
  { title: 'String Quartet', year: 1997 },
]

Work.create!(works)

black_music = Publisher.create!(name: 'Black Music House', city: 'Gotham', country: "USA")
ruby_tunes = Publisher.create!(name: 'RubyTunes', city: 'Shanghai', country: 'China')

editions = [
  { description: 'Facsimilie', publisher: black_music, year: 1998, price: 21.95 },
  { description: 'Urtext', publisher: ruby_tunes, year: 1977, price: 17.99 },
  { description: 'Ed. Y.Matsumo', publisher: ruby_tunes, year: 2001, price: 23.50 },
  { description: '', publisher: black_music, year: 1995, price: 39.95 },
  { description: 'Reprint', publisher: ruby_tunes, year: 2011, price: 31.99 },
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
