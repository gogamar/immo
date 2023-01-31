module TranslateHelper
  require "google/cloud/translate/v2"
  def translate_string(text, target_language)
    translate = Google::Cloud::Translate::V2.new(
    project_id: ENV["GOOGLE_PROJECT_ID"],
    credentials: ENV["GOOGLE_APPLICATION_CREDENTIALS"]
  )
    translation = translate.translate text, to: target_language
    return translation.text
  end
end
