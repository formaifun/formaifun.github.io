module Themes::Mai::DefaultHelper
  def self.included(klass)
    klass.helper_method [:get_taxonomy] rescue ""
  end

  def theme_mai_load_app

  end

  def theme_mai_settings(theme)

  end

  def get_taxonomy(taxonomies = {}, rel = '')
    list = []
    if taxonomies.present?
      taxonomies.each do |taxonomy|
        list << "<a href='#{taxonomy.the_url}' rel='#{rel}'>#{taxonomy.the_title}</a>"
      end
    end
    list.join(', ')
  end

  def theme_mai_on_install(theme)
    theme.add_field({"name"=>"Footer message", "slug"=>"footer"},{field_key: "editor", default_value: 'Copyright &copy; 2019. All rights reservated.'})
  end

  def mai_extra_custom_fields(args)
    args[:fields][:my_slider] = {
      key: 'my_slider',
      label: 'My Slider',
      render: theme_view('custom_field/my_slider.html.erb'),
      options: {
        required: true,
        multiple: true,
      },
      extra_fields:[
        {
          type: 'text_box',
          key: 'dimension',
          label: 'Dimensions',
          description: 'Crop images with dimension (widthxheight), sample:<br>400x300 | 400x | x300 | ?400x?500 | ?1400x (? => maximum, empty => auto)'
        }
      ]
    }
  end

end
