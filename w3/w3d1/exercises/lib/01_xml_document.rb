class XmlDocument

  attr_accessor :indent, :indent_count

  def initialize(indent = false)
    @indent = indent
    @indent_count = 0
  end

  def method_missing(method_name, *attrs, &blk)
    attrs = attrs.first || {}
    render_tag(method_name, attrs, &blk)
  end

  def attributes_to_string(attrs)
    attrs.map { |key, value| "#{key}=\"#{value}\""}
  end

  def indent
    @indent ? @indent_count += 1 : nil
  end

  def unindent
    @indent ? @indent_count -= 1 : nil
  end

  def new_line
    @indent ? "\n" : ""
  end

  def tab_space
    "  " * @indent_count
  end

  def open_tag(name, attrs)
    "#{tab_space}<#{tag_body(name, attrs)}>#{new_line}"
  end

  def closing_tag(name)
    "#{tab_space}</#{name}>#{new_line}"
  end

  def random_tag(name, attrs)
    "#{tab_space}<#{tag_body(name, attrs)}/>#{new_line}"
  end

  def tag_body(name, attrs)
    ([name] + attributes_to_string(attrs)).join(" ")
  end

  def render_tag(name, attrs, &blk)
    xml_output = ""

    if block_given?
      xml_output << "#{open_tag(name, attrs)}"
      indent
      xml_output << yield
      unindent
      xml_output << "#{closing_tag(name)}"
    else
      xml_output << random_tag(name, attrs)
    end

    xml_output
  end
end
