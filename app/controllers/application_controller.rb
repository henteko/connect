class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    render template: 'errors/error_404', status: 404, layout: 'application',
                     content_type: 'text/html'
  end

  def render_500(exception = nil)
    if exception
      logger.info "Rendering 500 with exception: #{exception.message}"
    end

    render template: 'errors/error_500', status: 500, layout: 'application'
  end

  def redirect_to_sign_in
    return redirect_to new_user_session_path
  end
end
