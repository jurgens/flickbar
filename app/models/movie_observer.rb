class MovieObserver < ActiveRecord::Observer
  def after_create(object)
    object.delay.imdb_search
  end
end
