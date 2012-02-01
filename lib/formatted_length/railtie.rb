module FormattedLength
  class Railtie < Rails::Railtie
    initializer 'formatted_length.model_additions' do
      ActiveSupport.on_load :active_record do
        extend ModelAdditions
      end
    end
  end
end