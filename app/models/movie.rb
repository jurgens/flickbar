class Movie < ActiveRecord::Base

  has_attached_file :poster,
        :styles => {:thumb => "33x50#", :small => "100x140>", :large => "200x280>"},
        :url => "/system/assets/:class/:attachment/:id/:style_:basename.:extension",
        :path => ":rails_root/public/system/assets/:class/:attachment/:id/:style_:basename.:extension",
        :default_url => "/images/missing_:class_:style.jpg"

  has_many :watches
  has_many :users, :through => :watches

  validates :title, :presence => true

  scope :recently_watched,  lambda { joins(:watches).select("DISTINCT movies.*").order("watches.created_at DESC").limit(20) }
  scope :pending_imdb,      where("imdb_not_found = 0").where("imdb_id IS NULL")

  def imdb_search
    begin
      search = Imdb::Search.new(self.title)
      self.imdb_not_found = true

      movie = search.movies.first
      if movie.title(true).downcase == self.title.downcase
        self.imdb_id  = movie.id
        self.director = movie.director.join(', ')
        self.poster = download_from_url(movie.poster) unless movie.poster.blank?
        [:rating, :year].each do |attr|
          self.send "#{attr}=", movie.send(attr)
        end
        self.imdb_not_found = false
      end
    rescue
      # do nothing
    end

    save
  end

  def imdb_page
    "http://www.imdb.com/title/tt#{imdb_id}" unless imdb_id.blank?
  end

protected

  def download_from_url(url)
    io = open(URI.parse(url))
    def io.original_filename; base_uri.path.split('/').last; end
    io.original_filename.blank? ? nil : io
  end

end