#encoding: utf-8
require 'nokogiri'
require 'pp'

html = <<-EOS
<div id="mod-detail-attributes" class="mod-detail-attributes">

<table>

<tbody>

<tr>  						<td class="de-feature">类别：空气滤清器</td>

<td class="de-feature">型号：MD603803</td>

<td class="de-feature">适用车型：三菱系列</td>

</tr> 											  <tr>  						<td class="de-feature">外型尺寸：172/121*117/67*213（mm） </td>

<td class="de-feature"></td><td class="de-feature"></td></tr>



</tbody>

</table>

</div>

EOS

doc = Nokogiri::HTML(html)
rows = doc.xpath('//table/tbody')
details = rows.collect do |row|
  detail = {}
  [
    [:title, 'tr[1]/td[1]/text()'],
    [:name, 'tr[1]/td[2]/text()'],
    [:date, 'tr[1]/td[3]/text()'],
  ].each do |name, xpath|
    detail[name] = row.at_xpath(xpath).to_s.strip
  end
  detail
end
pp details