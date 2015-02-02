# -*- encoding : utf-8 -*-
module ApplicationHelper

  def center_vert(options = {})
    content_tag(:div, :class => options[:container_class], :id => options[:container_id], :style => options[:container_style]) do
      content_tag(:div, '&nbsp;'.html_safe, :class => 'center_vert hidden') +
      content_tag(:div, :class => "center_vert #{options[:content_class]}", :id => options[:content_id]) do
        yield
      end
    end
  end

  def entry(entry, options={})
    content_tag(:li, class: "init with_col_right entry #{options[:class]} #{css_class(entry)}") do
      content_tag(:div, class: 'controls col_right') do    
        pie(entry) +
        x(entry)
      end +
      content_tag(:h3, entry.name, class: 'padded expand_elem', data: {elem_id: 'entry', url: "/entries/#{entry.id}"})
    end
  end

  def daily(entry, options={})
    content_tag(:li, class: "ui-state-default init with_small_col_left with_col_right daily #{options[:class]} #{css_class(entry)}") do
      content_tag(:div, class: 'controls small_col_left') do
        sort_triangle(entry)
      end +
      content_tag(:div, class: 'controls col_right') do    
        form_for(entry, remote: true, html: {class: 'control'}) do |f| 
          field(f, :check_box, :daily_completed, class: "smiley", namespace: "#{entry.id}_complete", checkbox_class: 'submit_on_change') +
          f.submit(class: 'hidden_submit not_displayed')
        end +
        daily_x(entry)
      end +
      content_tag(:h3, entry.name, class: 'padded expand_elem', data: {elem_id: 'entry', url: "/entries/#{entry.id}"})
    end
  end

  def to_do(to_do, options={})
    content_tag(:li, class: "ui-state-default init with_small_col_left with_col_right to_do #{options[:class]} #{css_class(to_do)}") do
      content_tag(:div, class: 'controls small_col_left') do
        sort_triangle(to_do)
      end +
      content_tag(:div, class: 'controls col_right') do    
        form_for(to_do, remote: true, html: {class: 'control'}) do |f| 
          field(f, :check_box, :completed, class: "smiley", namespace: "#{to_do.id}_complete", checkbox_class: 'submit_on_change') +
          f.submit(class: 'hidden_submit not_displayed')
        end +
        daily_x(to_do)
      end +
      content_tag(:h3, to_do.name, class: 'padded expand_elem', data: {elem_id: 'to_do', url: "/to_dos/#{to_do.id}"})
    end
  end


  def field(f, field_type, attr, options={})
    if field_type == :check_box
      checkbox_options = {class: "not_displayed #{options[:checkbox_class]}"}
      label_for        = attr
      if (options[:namespace])
        checkbox_options[:id] = "#{f.object.class.name.parameterize.underscore}_#{options[:namespace]}"
        label_for             = options[:namespace]
      end
      content_tag(:div, class: "field make_fake_checkbox #{options[:class]}") do
        content_tag(:span, attr.to_s.humanize, class: 'label') +
        f.send(field_type, attr, checkbox_options) +
        f.send(:label, label_for, '&nbsp;'.html_safe)
      end
    else
      content_tag(:div, class: 'field') do
        f.send(:label, attr) +
        f.send(field_type, attr)
      end
    end
  end

  def css_class(inst)
    "#{p_class(inst)}_#{inst.id}"
  end

  def p_class(inst, options={})
    c = inst.class.name.underscore
    c = c.pluralize if options[:plural]
    c
  end

  def h4(text, options={})
    content_tag(:h4, 
      content_tag(:span, '', class: 'h4_rule') +
      content_tag(:span, text, style: ("background:#{options[:bg]}" if options[:bg])), 
    class: options[:class])

  end

end
