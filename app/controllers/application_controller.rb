class ApplicationController < ActionController::API
  include Pagy::Backend

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_error(status: :not_found, title: "Not Found", detail: e.message)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render_error(status: :unprocessable_entity, title: "Validation Failed", detail: e.record.errors.full_messages)
  end

  rescue_from ActionController::ParameterMissing do |e|
    render_error(status: :bad_request, title: "Bad Request", detail: e.message)
  end

  private

  def render_error(status:, title:, detail:, source: nil)
    payload = {
      errors: [
        {
          status: Rack::Utils.status_code(status).to_s,
          title: title,
          detail: Array(detail).join(", "),
          source: source
        }.compact
      ]
    }
    render json: payload, status: status
  end
end
