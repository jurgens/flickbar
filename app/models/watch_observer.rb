class WatchObserver < ActiveRecord::Observer
  def after_create(object)
    Event.create! :movie => object.movie, :user => object.user, :kind => 'wish'
  end

  def after_watch(watch, transition)
    Event.create! :movie => watch.movie, :user => watch.user, :kind => 'watch'
  end
end
