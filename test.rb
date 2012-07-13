require 'nokogiri'
require 'pp'

html = <<-EOS
  <table >
    <tbody>
        <tr>    <!-- table header --> </tr>
    </tbody>
    <!-- show threads -->
    <tbody id="threadbits_forum_251">
        <tr>
            <td></td>
            <td></td>
            <td>
                <div>
                    <a href="showthread.php?t=230708" >Vb4 Gold Released</a>
                </div>
                <div>
                    <span><a>Paul M</a></span>
                </div>
            </td>
            <td>
                    06 Jan 2010 <span class="time">23:35</span><br />
                    by <a href="member.php?find=lastposter&amp;t=230708">shane943</a> 
                </div>
            </td>
            <td><a href="#">24</a></td>
            <td>1,320</td>
        </tr>

    </tbody>
</table>
EOS

doc = Nokogiri::HTML(html)
rows = doc.xpath('//table/tbody[@id="threadbits_forum_251"]/tr')
details = rows.collect do |row|
  detail = {}
  [
    [:title, 'td[3]/div[1]/a/text()'],
    [:name, 'td[3]/div[2]/span/a/text()'],
    [:date, 'td[4]/text()'],
    [:time, 'td[4]/span/text()'],
    [:number, 'td[5]/a/text()'],
    [:views, 'td[6]/text()'],
  ].each do |name, xpath|
    detail[name] = row.at_xpath(xpath).to_s.strip
  end
  detail
end
pp details