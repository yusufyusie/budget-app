module GroupsHelper
  def total_amount(group)
    group.purchases.sum(:amount)
  end

  def check_url(url)
    default = 'no-pictures.png'
    if (File.extname(url) =~ /\.(png|gif|jpg)\z/) || (url =~ /\A#{URI::DEFAULT_PARSER.make_regexp}\z/)
      url
    else
      default
    end
  end
end
