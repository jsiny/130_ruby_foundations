def format_date(date)
  regex = /
            \A
              (?<year>\d{4})
              (?<separator>[-\/])
              (?<month>\d{2})
              \k<separator>
              (?<day>\d{2})
            \z
          /x
  date.gsub(regex, '\k<day>.\k<month>.\k<year>')
end

p format_date('2016-06-17') == '17.06.2016'
p format_date('2017/05/03') == '03.05.2017'
p format_date('2015/01-31') == '2015/01-31'
