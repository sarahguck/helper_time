# -*- encoding : utf-8 -*-
module ControlsHelper
  def pie(inst)
    if inst.respond_to?(:progress) && inst.respond_to?(:total)
      progress  = inst.progress || 0
      total     = inst.total || 1
      fraction  = progress / total.to_f
      css_class = fraction > 0.5 ? 'slice big' : 'slice'
      rotation  = 360 * fraction

      if rotation > 180
        slice = content_tag(:div, 
                  content_tag(:div, '', class: 'slice_inner', style: "transform:rotate(180deg);"), 
                class: 'slice_outer') +
                content_tag(:div, 
                  content_tag(:div, '', class: 'slice_inner', style: "transform:rotate(#{rotation - 180}deg);"), 
                class: 'slice_outer', style: "transform:rotate(180deg);")
      else
        slice = content_tag(:div, 
                  content_tag(:div, '', class: 'slice_inner', style: "transform:rotate(#{rotation}deg);"), 
                class: 'slice_outer')
      end

      content_tag(:div, class: 'pie control') do
        content_tag(:div, '', class: 'pie_bg') + slice
      end
    else 
      ''
    end
  end

  def x(inst, options={})
    link_to('×', inst, class: "x control #{options[:class]}", method: :delete, remote: true)
  end

  def daily_x(entry, options={})
    link_to('×', remove_daily_path(:id => entry.id), class: "x control #{options[:class]}", method: 'post', remote: true)
  end

  def sort_triangle(entry)
    content_tag(:div, '▲', class: 'triangle', data: {id: entry.id})
  end
end