class CoursesController < EventsController
  before_action :set_polymorphic_courseable_out_of_params,
                only: %i[create update]
  before_action :set_event,
                only: %i[show edit update destroy]

  def new
    authorize(Course)
    @event = Course.new(duration: 180)
    @is_coach = false
    @is_autocoached = '1'
  end

  def edit
    @selected_user_id = @event.courseable.id
    @is_coach = @event.courseable.is_a? Coach
    @is_autocoached = (@event.courseable.is_a? Coach) ? '0' : '1'
  end

  def index
    authorize(Course)
    @future_events = Event.courses.future_events
    @passed_events = Event.courses.passed_events
  end

  def create
    @event = Course.new(event_params)
    authorize @event
    @service = GoogleCalendarService.new(current_user)
    result = add_to_google_calendar(@service, @event)
    if result.nil?
      redirect_to event_path(@event.reload),
                  alert: I18n.t('performances.fail_to_create')
      return nil
    end

    @event.fk = result.id
    @event.user_id = current_user.id
    @event.provider = 'google_calendar_v3'

    if @event.save
      redirect_to events_url(@event),
                  notice: I18n.t('performances.created')
    else
      respond_to do |format|
        format.html { render :new }
      end
    end
  end

  def set_polymorphic_courseable_out_of_params
    course = params.fetch(:course, nil)
    return if course.nil?

    if course.fetch(:is_autocoached, '1') == '1'
      params['course']['courseable_type'] = 'User'
      params['course']['courseable_id'] = course.fetch(:users_list, 0)
    else
      params['course']['courseable_type'] = 'Coach'
      params['course']['courseable_id'] = course.fetch(:coaches_list, 0)
    end
  end

  private

  def google_event_params(event)
    theater_name = event.theater.theater_name
    {
      title: I18n.t('courses.g_title_course', name: theater_name),
      location: event.theater.location,
      theater_name: theater_name,
      event_date: event.event_date.iso8601,
      event_end: (event.event_date + event.duration * 60).iso8601,
      attendees_email: [],
      fk: event.fk
    }
  end

  def set_event
    @event = Event.unscoped.send(set_type.pluralize).find(params[:id])
    authorize @event
  end

  def event_params
    params
      .require(set_type.to_sym)
      .permit(
        :event_date,
        :title,
        :duration,
        :note,
        :user_id,
        :theater_id,
        :fk,
        :type,
        :provider,
        :courseable_type,
        :courseable_id
      )
  end
end
