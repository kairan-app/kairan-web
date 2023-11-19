class UrlCleaner
  PARAMETERS_TO_BE_REMOVED = %w[
    utm_source
    utm_medium
    utm_campaign
    utm_term
    utm_content
    fbclid
    gclid
    yclid
  ].freeze

  def initialize(url)
    @uri = Addressable::URI.parse(url)
  end

  def clean
    result = @uri
    result.query_values = @uri.query_values&.except(*PARAMETERS_TO_BE_REMOVED)
    result.to_s.sub(/\?\z/, "")
  end
end
