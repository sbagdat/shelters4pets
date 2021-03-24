# frozen_string_literal: true

module TailwindHelper
  BTN_CLASS = "p-2 text-md text-white border w-24 text-center rounded-md my-4 inline-block"

  def tw_link(text, link, classes, **options)
    link_to text,
            link,
            class: "#{BTN_CLASS} #{classes}",
            **options
  end

  def tw_button(text, link, classes, **options)
    button_to text,
              link,
              class: "#{BTN_CLASS} #{classes}",
              **options
  end
end
