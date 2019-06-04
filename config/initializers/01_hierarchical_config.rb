# frozen_string_literal: true

PATHNAME              = Rails.root.join('config')
ENVIRONMENT           = Rails.env

WebPageTestConfig     = HierarchicalConfig.load_config('webpagetest', PATHNAME, ENVIRONMENT)
