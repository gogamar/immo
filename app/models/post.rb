class Post < ApplicationRecord
  require "google/cloud/translate/v2"
  belongs_to :category
  belongs_to :user
  has_one_attached :photo
  # after_create :translate_all

  def translate_to_es
    translate = Google::Cloud::Translate::V2.new(
      project_id: ENV["GOOGLE_PROJECT_ID"],
      credentials: ENV["GOOGLE_APPLICATION_CREDENTIALS"]
    )
    translation_es = translate.translate content, to: "es"
    return translation_es
  end

  def translate_to_en
    translate = Google::Cloud::Translate::V2.new(
      project_id: ENV["GOOGLE_PROJECT_ID"],
      credentials: ENV["GOOGLE_APPLICATION_CREDENTIALS"]
    )
    translation_en = translate.translate content, to: "en"
    return translation_en
  end

  def translate_to_fr
    translate = Google::Cloud::Translate::V2.new(
      project_id: ENV["GOOGLE_PROJECT_ID"],
      credentials: ENV["GOOGLE_APPLICATION_CREDENTIALS"]
    )
    translation_fr = translate.translate content, to: "fr"
    return translation_fr
  end

  def translate_all
    translate_to_es
    translate_to_en
    translate_to_fr
  end
end
