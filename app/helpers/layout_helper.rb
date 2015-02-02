# -*- encoding : utf-8 -*-
module LayoutHelper

  def content_span(options={}, &block)
    content_tag(:span, capture(&block), class: "padded #{options[:class]}", id: options[:id], data:options[:data])
  end

  def content_div(options={}, &block)
    content_tag(:div, capture(&block), class: "padded #{options[:class]}")
  end

  def content_li(options={}, &block)
    content_tag(:li, capture(&block), class: "padded #{options[:class]}", id: options[:id], data:options[:data])
  end

end