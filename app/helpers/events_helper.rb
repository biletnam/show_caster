module EventsHelper
  def get_duration(val)
    r = Event::DURATIONS.rassoc(val)
    r.nil? ? "" : r[0]
  end

  def get_progress(event)
    states = {
      draft: "label-default",
      finalized: "label-info",
      sent_to_media_1: "label-warning",
      ok_with_media_1: "label-success"
    }
    label_color = states.fetch event.progress.to_sym, "label-danger"

    "<span class='label #{label_color}'> #{event.progress_i18n} </span>".html_safe
  end

  def short_label_helper(event_id)
    event = Event.find_by(id: event_id)
    "<span class='label label-success'> #{event.theater.theater_name[0,25]}</span> <strong>#{event.event_date.strftime('%d-%b %Y')}</strong> | #{event.title[0,35]}".html_safe
  end

  def photo_indicator(event)
    unless event.photo_count.zero?
      "<span class='light-frame'><small><strong>#{event.photo_count}</strong></small>  #{fa_icon('image')}</span>".html_safe
    end
  end

  def link_to_event(event)
    if event.event_date < Time.zone.now
      if event.photo_count.zero?
        "#{fa_icon('image lg')}#{image_tag("transp.png")}#{fa_icon('eye lg')}".html_safe
      else
        "#{photo_indicator(event)}#{fa_icon('eye lg')}".html_safe
      end
    else
      "#{fa_icon('eye lg')}".html_safe
    end
  end

  def edit_event_path(event)
    klass = event.class.name
    action = "edit_#{klass.downcase}_path".to_sym
    send action, event
  end


end
