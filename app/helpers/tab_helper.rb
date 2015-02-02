# -*- encoding : utf-8 -*-
module TabHelper

  def tab_headings(arr)
    tabs = ''
    arr.each_with_index do |name, index|
      tabs += tab_heading(name, index == 0) 
    end
    content_tag(:div, tabs.html_safe, class: 'tab_headings')
  end

  def tab_heading(name, current)
    content_id = "tab_content_#{p(name)}"
    content_tag(:div, 
      content_tag(:h2, name, class: 'padded pointer'), 
    class: "tab_heading init #{'current' if current}", 
    data: {content_id: content_id})
  end

  def tab_content(name, options={}, &block)
    current    = options[:current]
    content_id = "tab_content_#{p(name)}"
    content_tag(:div, capture(&block), class: "tab_content#{' current' if current}", id:content_id)
  end

end