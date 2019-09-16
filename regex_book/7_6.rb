def format_date(date)
  if date =~ /\b\d{4}-\d{2}-\d{2}\b/
    date.split(/-/).reverse.join('.')
  else
    date
  end
end

p format_date('2016-06-17') == '17.06.2016'
p format_date('2016/06/17') == '2016/06/17' # (no change)

# ---- With capture groups ----

def formatt_date(date)
  date.gsub(/\b(\d{4})-(\d{2})-(\d{2})\b/,'\3.\2.\1')
end

p formatt_date('2016-06-17') == '17.06.2016'
p formatt_date('2016/06/17') == '2016/06/17'
