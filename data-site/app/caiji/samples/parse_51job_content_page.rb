#encoding: utf-8

require 'nokogiri'
require 'pp'

html=<<HTML_str
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>【北京旌旗智远商业经纪有限公司招聘，求职】北京旌旗智远商业经纪有限公司前程无忧官方招聘网站</title>
<meta name="description" content="北京旌旗智远商业经纪有限公司招聘 前程无忧官方网站，提供最新最全北京旌旗智远商业经纪有限公司招聘职位。帮助您顺利踏入北京旌旗智远商业经纪有限公司的大门，与众多北京旌旗智远商业经纪有限公司精英们开启一段崭新的职业生涯。">
<meta name="robots" content="all">
<link href="http://js.51jobcdn.com/in/css/style.css?20101230" rel="stylesheet" type="text/css" />
<link href="http://js.51jobcdn.com/in/css/logo.css?20101230" rel="stylesheet" type="text/css" />
<link href="http://js.51jobcdn.com/in/css/my.css?20101230" rel="stylesheet" type="text/css" />
<link href="http://js.51jobcdn.com/in/css/search.css?20100707" rel="stylesheet" type="text/css" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" media="screen" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" media="screen" />
<link rel="bookmark" href="/favicon.ico">
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/Base.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/Base.ZzLayer.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/Base.ZzLayer.ExtZzLayer.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/search/Base.Search.js?20100407"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/my/My_SMS_Self.js?20100421"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/fans.js?20120116"></script>
</head>
<body>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/jQuery.js"></script>

<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/JsBase.js"></script>

<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/login.js?20110422"></script><!--top start-->

<div id="top">

    <div id="logobg">

    <div id="arealogo"><a href="http://www.51job.com/default.php" onfocus="blur()"><img src="http://img01.51jobcdn.com/im/2009/logo/logo2009.gif" alt="前程无忧"/></a>

<!--<embed src="http://img01.51jobcdn.com/im/2009/logo/logo51.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="215" height="65" wmode="transparent"></embed>-->

 </div>

    <p id="areaver"> <span><a href="javascript:void(0)" onclick="return j2gb('');" onfocus="blur()">

    <script language="javascript">

    <!--

    if(location.hostname == "big5.51job.com") {

       document.write("简体版");

    } else {

       document.write("繁体版");

    }

    //-->

    </script></a></span><span><img src="http://img01.51jobcdn.com/im/2009/vline.gif" alt="" align="absmiddle"/></span> <span><a href="http://www.51job.com/default-e.php" onfocus="blur()">English</a></span></p>

    <span><img src="http://img01.51jobcdn.com/im/2009/logox1.gif" alt=""/></span> </div>

  <p class="loginname" id="loginname">

      </p>

  <div class="navbt">

    <ul>

      <li><img src="http://img01.51jobcdn.com/im/2009/navx.gif" /><a href="http://www.51job.com/default.php" onfocus="blur()">首页</a></li>

      <li><img src="http://img01.51jobcdn.com/im/2009/navx.gif" /><a href="http://tr.51job.com/default-tr.php" onfocus="blur()">培训充电</a></li>

      <li><img src="http://img01.51jobcdn.com/im/2009/navx.gif" /><a href="http://www.51job.com/default-gj.php" onfocus="blur()">高级猎头</a></li>

      <li><img src="http://img01.51jobcdn.com/im/2009/navx.gif" /><a href="http://www.51job.com/default-it.php" onfocus="blur()">IT人才</a></li>

      <li><img src="http://img01.51jobcdn.com/im/2009/navx.gif" /><a href="http://arts.51job.com/cls/class_0501.html" onfocus="blur()">求职攻略</a></li>

      <li><img src="http://img01.51jobcdn.com/im/2009/navx.gif" /><a href="http://bbs.51job.com" onfocus="blur()">BBS</a></li>

      <li><img src="http://img01.51jobcdn.com/im/2009/navx.gif" /><a href="http://www.51job.com/pm/app/index.html" onfocus="blur()"><img src="http://img01.51jobcdn.com/im/2009/menu_app.gif" style="margin-top:-3px;"/></a></li>

      <li>

                  <span id="loginOutLink" style="display:none;"><a href="http://my.51job.com/my/My_SignOut.php" class="orange" onfocus="blur()">退出</a></span>

          <span id="loginInLink"><a href="http://my.51job.com/my/My_SignUp.php" class="orange" onfocus="blur()">注册</a><span class="orareg">|</span><a href="javascript:void(0);" onclick="showLoginDiv(this)" class="orange" onfocus="blur()">登录</a></span>

              </li>

    </ul>

  </div>

  <div class="clearboth"></div>

  <!--地区频道-->

  <div class="navbtbg">

    <ul>

      <li class="bts"><a href="javascript:gotoehire(0)" onfocus="blur()"><img src="http://img01.51jobcdn.com/im/2009/area/company.gif" alt="企业登录" border="0"/></a></li>

      <li class="bts"><img src="http://img01.51jobcdn.com/im/2009/area/area1.gif" alt="地区频道" usemap="#Map"  id="all-channel-btn"/>

      <map name="Map" id="Map">

        <area shape="rect" coords="74,0,139,19" href="javascript:void(0);" onmouseover="showAreaDiv($('#all-channel-btn')[0],this)" />

      </map></li>

      <li class="bts"><a href="http://www.51job.com/default_res.php" onfocus="blur()"><img src="http://img01.51jobcdn.com/im/2009/area/career1.gif" alt="职场资讯" border="0"/></a></li>

      <li class="bts"><a href="http://xy.51job.com/default-xs.php" onfocus="blur()"><img src="http://img01.51jobcdn.com/im/2009/area/school1.gif" alt="校园招聘" border="0"/></a></li>

      <li class="bts"><a href="http://my.51job.com/cv/CResume/CV_CResumeManage.php" onfocus="blur()"><img src="http://img01.51jobcdn.com/im/2009/area/resume1.gif" alt="简历管理" border="0"/></a></li>

      <li class="btshow"><a href="http://search.51job.com/jobsearch/advance_search.php?stype=2" onfocus="blur()"><img src="http://img01.51jobcdn.com/im/2009/area/search.gif" alt="职位搜索" border="0"/></a></li>

      <li class="bts"><a href="http://my.51job.com/my/My_Pmc.php" onfocus="blur()"><img src="http://img01.51jobcdn.com/im/2009/area/my51job1.gif" alt="my51job" border="0"/></a></li>

    </ul>

  </div>

  <div class="clearboth"></div>

    <div class="menu2">

  <table class="tbl searchNav">

    <tr>

      <td>

        <a href="http://search.51job.com/jobsearch/advance_search.php?lang=c&stype=2">高级搜索</a><br />&nbsp;

      </td>

      <td>&nbsp;|&nbsp;<br />&nbsp;</td>

      <td>

        <a href="http://search.51job.com/jobsearch/index.php?lang=c&stype=1">关键字搜索</a><br />&nbsp;

      </td>

      

      <td>&nbsp;|&nbsp;<br />&nbsp;</td>

      <td>

        <a href="http://search.51job.com/jobsearch/map_search.php?lang=c&stype=3">地图搜索</a><br />&nbsp;

      </td>

      <td>&nbsp;<img src="http://img01.51jobcdn.com/im/2009/my/hot001.gif" /><br />&nbsp;</td>

    </tr>

  </table>



<span class="xqts"><b>小Q提示：</b>投简历没有回音？别急，有付出就会有回报，继续努力！</span></div>

  <div class="top_login_container" id="loginDiv">

    <div class="top_login_head">

      <p class="top_login_name">请登录</p>

      <p class="top_login_close"><a href="javascript:void(0)" onclick="hideLoginDiv()"><img src="http://img01.51jobcdn.com/im/2009/bbs/close.gif"/></a></p>

    </div>

    <div class="top_login_content">

      <form id="top_login_form" onsubmit="loginIn('http://my.51job.com');return false;">

        <div style="display:none;"><input type="hidden" id="top_login_language" value="zh-cn"></div>

        <table width="90%" border="0" align="center" cellpadding="2" cellspacing="0">

          <tr><td height="20" id="top_login_form_validate_tips" align="left" colspan="3"></td></tr>

          <tr><td height="29" align="left"><p>用户名：</p></td><td><input type="text" id="top_login_username" class="top_login_input"/></td><td>&nbsp;</td></tr>

          <tr><td align="left" valign="top"><p>密&nbsp;&nbsp;码：</p></td><td valign="top"><input type="password" id="top_login_userpwd" class="top_login_input"/></td><td><a href="http://my.51job.com/my/My_ForgetEmail.php" target="_blank" class="orange">忘记密码</a></td></tr>

          <tr><td colspan="3" align="center"><input name="submit" type="submit" class="top_login_btn" value="登录" id="top_login_submit_btn"/>&nbsp;&nbsp;<a href="http://my.51job.com/my/My_SignUp.php" class="orange" onfocus="blur()"><input type="button" onclick="window.location='http://my.51job.com/my/My_SignUp.php'" class="top_login_btn" value="注册" /></a></td></tr>

        </table>

      </form>

    </div>

  </div>

  

<div id="all-channel" align="left"  style="overflow:hidden;border:#82868D solid 1px;  font-size:12px;width:470px;display:none;z-index:999;background:url(http://img01.51jobcdn.com/im/2009/my/folder/gray_bg02.gif) repeat-x;" >

  <p  style="height:28px; color:#FF5F00;font-size:14px;font-weight:bold;padding-left:20px;line-height:28px;background:none; border-bottom:1px solid #C6C9CC; padding-left:10px;"><span class="top_login_close"><img src="http://img01.51jobcdn.com/im/2009/emy/folder/icon_close.gif" align="absmiddle"  onclick="document.getElementById('all-channel').style.display='none';"/></span>按拼音选择</p>

  <div style="width:470px; padding-left:5px;">

  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="diqucengcu">

  <tr class="danshuang">

    <td width="20" align="center"><strong>B</strong></td>

    <td width="180"> 

    <a href="http://www.51job.com/default-area.php?area=0100"><strong style="color:#000;">北京</strong></a> 

    <a href="http://www.51job.com/default-area.php?area=2804">包头</a>

    <a href="http://www.51job.com/default-area.php?area=1604">保定</a>

    </td>

  <td width="20" align="center"><strong>M</strong></td>

    <td>

    <a href="http://www.51job.com/default-area.php?area=0903"><span>绵阳</span></a>

  </td>

  </tr>

  <tr>

    <td align="center"><strong>C</strong></td>

    <td><a href="http://www.51job.com/default-area.php?area=2402">长春</a> 

    <a href="http://www.51job.com/default-area.php?area=1902">长沙</a>

    <a href="http://www.51job.com/default-area.php?area=0902">成都</a>

    <a href="http://www.51job.com/default-area.php?area=0600">重庆</a>

    <a href="http://www.51job.com/default-area.php?area=0705">常州</a>

    <a href="http://www.51job.com/default-area.php?area=1907">常德</a>

  </td>

    <td align="center"><strong>N</strong></td>

    <td><a href="http://www.51job.com/default-area.php?area=0702">南京</a> <a href="http://www.51job.com/default-area.php?area=0803">宁波</a> <a href="http://www.51job.com/default-area.php?area=1302">南昌</a> <a href="http://www.51job.com/default-area.php?area=0709">南通</a> <a href="http://www.51job.com/default-area.php?area=1402">南宁</a></td>

  </tr>

  <tr class="danshuang">

    <td align="center"></td>

  <td><a href="http://www.51job.com/default-area.php?area=0707">常熟</a></td>

  <td align="center"><strong>Q</strong></td>

    <td><a href="http://www.51job.com/default-area.php?area=1203">青岛</a>  

       <a href="http://www.51job.com/default-mn.php?area=1104">泉州</a>

     <a href="http://www.51job.com/default-area.php?area=1606">秦皇岛</a>

     <a href="http://www.51job.com/default-area.php?area=0319">清远</a></td>

  </tr>

  <tr>

    <td align="center"><strong>D</strong></td>

    <td>

  <a href="http://www.51job.com/default-area.php?area=2303">大连</a>  

  <a href="http://www.51job.com/default-area.php?area=0308">东莞</a>  

  </td>

    <td align="center"><strong>S</strong></td>

    <td><a href="http://www.51job.com/default-area.php?area=0200"><strong style="color:#000;">上海</strong></a>

      <a href="http://www.51job.com/default-area.php?area=0400"><strong style="color:#000;">深圳</strong></a> 

    <a href="http://www.51job.com/default-area.php?area=2302">沈阳</a>  

     <a href="http://www.51job.com/default-area.php?area=1602">石家庄</a>  

     <a href="http://www.51job.com/default-area.php?area=0703">苏州</a> 

    <a href="http://www.51job.com/default-area.php?area=1003">三亚</a>  

     <a href="http://www.51job.com/default-area.php?area=0805">绍兴</a>

     

  </td>

  </tr>

  <tr class="danshuang">

    <td align="center"><strong>F</strong></td>

    <td><a href="http://www.51job.com/default-area.php?area=1102">福州</a> 

    <a href="http://www.51job.com/default-area.php?area=0306">佛山</a>

  </td>

    <td align="center"></td>

    <td><a href="http://www.51job.com/default-area.php?area=0304">汕头</a>

  <a href="http://www.51job.com/default-area.php?area=0325">顺德</a></td>

  </tr>

  <tr>

    <td align="center"><strong>G</strong></td>

    <td><a href="http://www.51job.com/default-area.php?area=0302"><strong style="color:#000;">广州</strong></a> 

    <a href="http://www.51job.com/default-area.php?area=2602">贵阳</a>

  </td>

    <td align="center"><strong>T</strong></td>

    <td><a href="http://www.51job.com/default-area.php?area=0500">天津</a> 

    <a href="http://www.51job.com/default-area.php?area=2102">太原</a>

    <a href="http://www.51job.com/default-area.php?area=0808">台州</a>

    <a href="http://www.51job.com/default-area.php?area=1605">唐山</a>

    <a href="http://www.51job.com/default-area.php?area=0718">泰州</a>

    </td>

  </tr>

  <tr class="danshuang">

    <td align="center"><strong>H</strong></td>

    <td>

    <a href="http://www.51job.com/default-area.php?area=2202">哈尔滨</a>

    <a href="http://www.51job.com/default-area.php?area=0802">杭州</a>

    <a href="http://www.51job.com/default-area.php?area=1502">合肥</a>

    <a href="http://www.51job.com/default-area.php?area=1002">海口</a>

    <a href="http://www.51job.com/default-area.php?area=2802">呼和浩特</a>

    </td>

    <td align="center"><strong>W</strong></td>

    <td>

    <a href="http://www.51job.com/default-area.php?area=1802">武汉</a> 

    <a href="http://www.51job.com/default-area.php?area=0704">无锡</a> 

    <a href="http://www.51job.com/default-area.php?area=0804">温州</a>

    <a href="http://www.51job.com/default-area.php?area=3102">乌鲁木齐</a>

    <a href="http://www.51job.com/default-area.php?area=1503">芜湖</a>

    <a href="http://www.51job.com/default-area.php?area=1205">潍坊</a>

    <a href="http://www.51job.com/default-area.php?area=1206">威海</a>

  </td>

  </tr>

  <tr>

    <td align="center"></td>

    <td>

    <a href="http://www.51job.com/default-area.php?area=0303">惠州</a>

    <a href="http://www.51job.com/default-area.php?area=1905">衡阳</a>

    <a href="http://www.51job.com/default-area.php?area=0719">淮安</a>

    <a href="http://www.51job.com/default-area.php?area=0809"><span>湖州</span></a>

    </td>

    <td align="center"><strong>X</strong></td>

    <td><a href="http://www.51job.com/default-area.php?area=2002">西安</a> 

    <a href="http://www.51job.com/default-mn.php?area=1103">厦门</a>

    <a href="http://www.51job.com/default-area.php?area=0711">徐州</a>

    <a href="http://www.51job.com/default-area.php?area=1805">襄阳</a>

    <a href="http://www.51job.com/default-area.php?area=1904">湘潭</a>

    </td>

  </tr>

  <tr class="danshuang">

    <td align="center"><strong>J</strong></td>

    <td>    

    <a href="http://www.51job.com/default-area.php?area=1202">济南</a>

    <a href="http://www.51job.com/default-area.php?area=0807">嘉兴</a>

    <a href="http://www.51job.com/default-area.php?area=0806">金华</a>

    <a href="http://www.51job.com/default-area.php?area=2403">吉林</a>

    <a href="http://www.51job.com/default-area.php?area=0315">江门</a>

    <a href="http://www.51job.com/default-area.php?area=1807">荆州</a>

  </td>

    <td align="center"><strong>Y</strong></td>

    <td><a href="http://www.51job.com/default-area.php?area=1204">烟台</a>

    <a href="http://www.51job.com/default-area.php?area=0708">扬州</a>

    <a href="http://www.51job.com/default-area.php?area=1803">宜昌</a>

    <a href="http://www.51job.com/default-area.php?area=0713">盐城</a>

    <a href="http://www.51job.com/default-area.php?area=0814"><span>义乌</span></a>

  </td>

  </tr>

  <tr>

    <td align="center"></td>

    <td>

    <a href="http://www.51job.com/default-area.php?area=0715">江阴</a>

    <a href="http://www.51job.com/default-area.php?area=1209"><span>济宁</span></a>

  </td>

  <td align="center"><strong>Z</strong></td>

    <td>

  <a href="http://www.51job.com/default-mn.php?area=1105">漳州</a> 

  <a href="http://www.51job.com/default-area.php?area=1702">郑州</a>

  <a href="http://www.51job.com/default-area.php?area=0307">中山</a>

  <a href="http://www.51job.com/default-area.php?area=0305">珠海</a>

  <a href="http://www.51job.com/default-area.php?area=0710">镇江</a>

  <a href="http://www.51job.com/default-area.php?area=1903">株洲</a>

  <a href="http://www.51job.com/default-area.php?area=0317">湛江</a>

  <a href="http://www.51job.com/default-area.php?area=0318">肇庆</a>

  </td>

  </tr>

  <tr class="danshuang">

    <td align="center"><strong>K</strong></td>

    <td><a href="http://www.51job.com/default-area.php?area=2502">昆明</a>

    <a href="http://www.51job.com/default-area.php?area=0706">昆山</a>

  </td>

    <td align="center"></td>

    <td>

    <a href="http://www.51job.com/default-area.php?area=0714">张家港</a>

    <a href="http://www.51job.com/default-area.php?area=1207"><span>淄博</span></a>

  </td>

  </tr>

  <tr>

    <td align="center"><strong>L</strong></td>

    <td>

    <a href="http://www.51job.com/default-area.php?area=2702">兰州</a>

    <a href="http://www.51job.com/default-area.php?area=1603">廊坊</a>

    <a href="http://www.51job.com/default-area.php?area=1208">临沂</a>

    <a href="http://www.51job.com/default-area.php?area=1703">洛阳</a>

    <a href="http://www.51job.com/default-area.php?area=0712">连云港</a>

  </td>

  </tr>

</table>

  </div>

  <iframe src="about:blank" scrolling="no" frameborder="0" marginheight="0" marginwidth="0" style="position:absolute;  top:0px; left:0px; width:415px; height:112px; z-index:-1;filter='progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)';"></iframe> 

</div></div>

<!--top end-->

<div class="maincenter bgjob1" style="margin-bottom: 10px;"><div class="sr_ad"><div style="text-align: center;margin-bottom:5px;"><div id="adTonglan"></div><script type="text/javascript">var ads = new Array();ads[1] = '<div><div align=center style="position:absolute;cursor:pointer;height:90px;"><a href="http://ac.51job.com/phpAD/adtrace.php?ID=12992117"title="51job携手专家帮你搞定英文简历！" target="_blank" onfocus="blur()"><img  align="center" src="http://img01.51jobcdn.com//im/2009/spear.gif" width="750" border="0" height="90"></a></div><embed style="padding:0px;margin:0px;" align="center" width="750" height="90"src="http://images.51job.com/im/pm/adflash/en750x90new.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></div><div><img src="http://www.51job.com/ex/page_view.php/adid=12992117"  width="0" border="0" height="0"/></div>';ads[2] = '<div><div align=center style="position:absolute;cursor:pointer;height:90px;"><a href="http://ac.51job.com/phpAD/adtrace.php?ID=12798249"title="免费下载前程无忧手机客户端" target="_blank" onfocus="blur()"><img  align="center" src="http://img01.51jobcdn.com//im/2009/spear.gif" width="750" border="0" height="90"></a></div><embed style="padding:0px;margin:0px;" align="center" width="750" height="90"src="http://img01.51jobcdn.com/im/images/2010/careerpost/mobile/ad/750_90.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></div><div><img src="http://www.51job.com/ex/page_view.php/adid=12798249"  width="0" border="0" height="0"/></div>';var index = Math.floor(Math.random()*2+1);var ad = ads[index];if(ad){document.getElementById('adTonglan').innerHTML=ad;}</script></div><div class="s_txt_jobs"><br />

      <table width="701" border="0" align="center" cellpadding="5" cellspacing="0" class="jobs_1">

        <tr>

          <td class="sr_bt" colspan="1" >北京旌旗智远商业经纪有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#syzw" class="orange"><strong>查看招聘中的职位&gt;&gt;</strong></a></td>

        </tr>

        <tr><td><strong>公司行业：</strong>&nbsp;&nbsp;金融/投资/证券<br><br><strong>公司性质：</strong>&nbsp;&nbsp;民营公司<br><br><strong>公司规模：</strong>&nbsp;&nbsp;50-150人</td></tr>

      </table>

    

      <div class="jobs_com">

        <div class="graybttop">

          <span><img src="http://img01.51jobcdn.com/im/2009/graybttl.gif" align="left"/></span>

          <span><img src="http://img01.51jobcdn.com/im/2009/graybttr.gif" align="right"/></span>

          <div class="btname" style="overflow:auto;"><a name="gsjj"></a><table border="0" width="100%" cellspacing="0" cellpadding="0" style="background-image: url(http://img01.51jobcdn.com/im/2009/search/c/gsjjbt.gif);background-repeat: no-repeat;"><tr><td width="65%"><input name="coid" type="hidden" value="2794144"/></td><td width="35%" align="right" id="2794144"></td></tr></table></div>

        </div>

        <div class="grayline">

          <p class="graybttopbg"></p>

          <div class="jobs_txt">

            <p class="txt_font">北京旌旗智远商业经纪有限公司为北京市集团性质的公司，是新疆海川新盟商品交易股份有限公司驻北京办事处。同时也为山东寿光蔬菜产业集团（天津）商品交易所在北京地区服务中心。<br>公司秉承积极、奋进、仁爱、团结的经营理念，立足北京，面向全国市场，为热爱金融行业，有志成为顶尖操盘手，有志创业的人士打造最佳的发展平台。<br>本集团公司在业界有十多年的专业团队运作经验，在全国有着良好的口碑和声望，培养了业界众多的精英，为推动行业发展和繁荣做出了不朽的贡献。<br>&nbsp;&nbsp;&nbsp;公司一直把人才的发掘和战略储备作为公司发展的第一要务，发现人才并培养人才是公司始终不渝的发展理念。在未来的3年内在北京乃至全国开立众多的分公司积极的发现人才和储备人才为目前公司的重大战略。</p>

            <p class="pot2"></p><p class="txt_font1">公司网址：<a href="http://www.test.com">http://www.test.com</a></p> <p class="txt_font1">联&nbsp;系&nbsp;人：丁小姐</p><p class="txt_font1">电&nbsp;&nbsp;&nbsp;&nbsp;话：(010)63453006</p><p class="txt_font1">传&nbsp;&nbsp;&nbsp;&nbsp;真：(010)63453006</p><p class="txt_font1">地&nbsp;&nbsp;&nbsp;&nbsp;址：北京市西城区南滨河路27号贵都国际中心A座1910<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="mapurlfont" style="color:#256db9;" onclick="smsEntry('http://my.51job.com','2794144'); return false;"><img src="http://img01.51jobcdn.com/im/2009/search/ico-phone.gif" align="absmiddle" style="margin-right:5px" />发送到手机</a></p><p class="txt_font1">邮政编码：100055</p>

          </div>

        </div>

        <div class="graybott">

          <span><img src="http://img01.51jobcdn.com/im/2009/graybl.gif" align="left"/></span>

          <span><img src="http://img01.51jobcdn.com/im/2009/graybr.gif" align="right"/></span>

        </div>

      </div>

      

      <table cellpadding="0" cellspacing="0" class="jobs_1 coJobList">

        <tr style="height:1px;"><td colspan="5" style="height:1px;"><div style="height:1px;over-flow:hidden;"><a name="syzw">&nbsp;</a></div></td></tr>

        <tr><td colspan="5" width="100%" style="padding:0px;"><table cellpadding="0" cellspacing="0" align="right"><tr><td class="coPerPage"><span>每页显示</span><a class="txtlab1" href="http://search.51job.com/list/co,c,2794144,0000,10,1.html">10</a><a class="txtlab" href="http://search.51job.com/list/co,c,2794144,0000,20,1.html">20</a><a class="txtlab" href="http://search.51job.com/list/co,c,2794144,0000,50,1.html">50</a><span>行&nbsp;&nbsp;&nbsp;</span></td><td><table  class="searchPageNav" cellpadding="0" cellspacing="0" ><tr><td  style="padding-right:5px;" ><img src="http://img01.51jobcdn.com/im/2009/pageloff.gif" border="0" /></td><td  class="currPage" >1</td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,2.html"  class="orange1" >2</a></td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,3.html"  class="orange1" >3</a></td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,4.html"  class="orange1" >4</a></td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,5.html"  class="orange1" >5</a></td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,6.html"  class="orange1" >6</a></td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,2.html"  class="orange1"  style="border:0px; width:auto;margin-left:5px;" ><img src="http://img01.51jobcdn.com/im/2009/pageron.gif" border="0" /></a></td></tr></table></td></tr></table></td></tr>

        <tr>

          <td class="txt_7 td0">职位名称</td>

          <td class="txt_7 td1"><select  onchange="javascript: location.href = this.options[selectedIndex].getAttribute( 'coAllJobHref' );" ><option value="0000"  selected  coAllJobHref="http://search.51job.com/list/co,c,2794144,0000,10,1.html"  >工作地点</option><option value="0102"  coAllJobHref="http://search.51job.com/list/co,c,2794144,0102,10,1.html"  >北京-西城区</option></select></td>

          <td class="txt_7 td2">发布日期</td>

          <td class="txt_7 td3">截止日期</td>

          <td class="txt_7 td4" style="border-right:0px;">招聘人数</td>

        </tr>

        <tr><td class="txt_5 td0"><a href="http://search.51job.com/job/51137897,c.html" class="blue" target="_blank">业务助理</a></td><td class="txt_5 td1">北京-西城区</td><td class="txt_5 td2">2012-06-11</td><td class="txt_5 td3">2012-08-11</td><td class="txt_5 td4">若干&nbsp;</td></tr><tr><td class="txt_5 td0"><a href="http://search.51job.com/job/51137829,c.html" class="blue" target="_blank">业务主管</a></td><td class="txt_5 td1">北京-西城区</td><td class="txt_5 td2">2012-06-11</td><td class="txt_5 td3">2012-08-11</td><td class="txt_5 td4">若干&nbsp;</td></tr><tr><td class="txt_5 td0"><a href="http://search.51job.com/job/51137767,c.html" class="blue" target="_blank">商务经理</a></td><td class="txt_5 td1">北京-西城区</td><td class="txt_5 td2">2012-06-11</td><td class="txt_5 td3">2012-08-11</td><td class="txt_5 td4">若干&nbsp;</td></tr><tr><td class="txt_5 td0"><a href="http://search.51job.com/job/51137705,c.html" class="blue" target="_blank">金融经纪人</a></td><td class="txt_5 td1">北京-西城区</td><td class="txt_5 td2">2012-06-11</td><td class="txt_5 td3">2012-08-11</td><td class="txt_5 td4">若干&nbsp;</td></tr><tr><td class="txt_5 td0"><a href="http://search.51job.com/job/51160597,c.html" class="blue" target="_blank">市场专员</a></td><td class="txt_5 td1">北京-西城区</td><td class="txt_5 td2">2012-06-11</td><td class="txt_5 td3">2012-08-11</td><td class="txt_5 td4">若干&nbsp;</td></tr><tr><td class="txt_5 td0"><a href="http://search.51job.com/job/51160525,c.html" class="blue" target="_blank">商务专员</a></td><td class="txt_5 td1">北京-西城区</td><td class="txt_5 td2">2012-06-11</td><td class="txt_5 td3">2012-08-11</td><td class="txt_5 td4">若干&nbsp;</td></tr><tr><td class="txt_5 td0"><a href="http://search.51job.com/job/51160456,c.html" class="blue" target="_blank">高级销售顾问</a></td><td class="txt_5 td1">北京-西城区</td><td class="txt_5 td2">2012-06-11</td><td class="txt_5 td3">2012-08-11</td><td class="txt_5 td4">若干&nbsp;</td></tr><tr><td class="txt_5 td0"><a href="http://search.51job.com/job/51160228,c.html" class="blue" target="_blank">海川新盟北京市场直招操盘手</a></td><td class="txt_5 td1">北京-西城区</td><td class="txt_5 td2">2012-06-11</td><td class="txt_5 td3">2012-08-11</td><td class="txt_5 td4">若干&nbsp;</td></tr><tr><td class="txt_5 td0"><a href="http://search.51job.com/job/51160173,c.html" class="blue" target="_blank">公司直招高级核心操盘手</a></td><td class="txt_5 td1">北京-西城区</td><td class="txt_5 td2">2012-06-11</td><td class="txt_5 td3">2012-08-11</td><td class="txt_5 td4">若干&nbsp;</td></tr><tr><td class="txt_5 td0"><a href="http://search.51job.com/job/51160125,c.html" class="blue" target="_blank">山东寿光北京市场直招操盘手</a></td><td class="txt_5 td1">北京-西城区</td><td class="txt_5 td2">2012-06-11</td><td class="txt_5 td3">2012-08-11</td><td class="txt_5 td4">若干&nbsp;</td></tr>

        <tr><td colspan="5" width="100%" style="padding:0px;"><table cellpadding="0" cellspacing="0" align="right"><tr><td class="coPerPage"><span>每页显示</span><a class="txtlab1" href="http://search.51job.com/list/co,c,2794144,0000,10,1.html">10</a><a class="txtlab" href="http://search.51job.com/list/co,c,2794144,0000,20,1.html">20</a><a class="txtlab" href="http://search.51job.com/list/co,c,2794144,0000,50,1.html">50</a><span>行&nbsp;&nbsp;&nbsp;</span></td><td><table  class="searchPageNav" cellpadding="0" cellspacing="0" ><tr><td  style="padding-right:5px;" ><img src="http://img01.51jobcdn.com/im/2009/pageloff.gif" border="0" /></td><td  class="currPage" >1</td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,2.html"  class="orange1" >2</a></td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,3.html"  class="orange1" >3</a></td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,4.html"  class="orange1" >4</a></td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,5.html"  class="orange1" >5</a></td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,6.html"  class="orange1" >6</a></td><td><a href="http://search.51job.com/list/co,c,2794144,0000,10,2.html"  class="orange1"  style="border:0px; width:auto;margin-left:5px;" ><img src="http://img01.51jobcdn.com/im/2009/pageron.gif" border="0" /></a></td></tr></table></td></tr></table></td></tr>

      </table>

    <div class="jobs_com">

        <div class="graytop">

          <span><img src="http://img01.51jobcdn.com/im/2009/graytl.gif" align="left"/></span>

          <span><img src="http://img01.51jobcdn.com/im/2009/graytr.gif" align="right"/></span>

        </div>

        <div class="grayline">

          <div class="jobs_txt" ><table style='width: 100%;line-height:18px;background-color:#ffffff;'>
<tr><td width="50%" align="left">·<a href='http://ac.51job.com/phpAD/adtrace.php?ID=13327140' title='职场PK必杀技，一切对手都是浮云'  style='color:#264f87;'  target='_blank'>职场PK必杀技，一切对手都是浮云</a></td>
<td width="50%" align="left">·<a href='http://ac.51job.com/phpAD/adtrace.php?ID=13330867' title='如何摆脱“低薪族”？' style='color:#264f87;'  target='_blank'>如何摆脱“低薪族”？</a></td></tr>
<tr><td width="50%" align="left">·<a href='http://ac.51job.com/phpAD/adtrace.php?ID=13330868' title='求职中4种“多多易败”的行为'  style='color:#264f87;'  target='_blank'>求职中4种“多多易败”的行为</a></td>
<td width="50%" align="left">·<a href='http://ac.51job.com/phpAD/adtrace.php?ID=13330870' title='谨言慎行，预防试用期提前“夭折”' style='color:#264f87;'  target='_blank'>谨言慎行，预防试用期提前“夭折”</a></td></tr>
<tr><td width="50%" align="left">·<a href='http://ac.51job.com/phpAD/adtrace.php?ID=13330871' title='五招让你试用期提前转正'  style='color:#264f87;'  target='_blank'>五招让你试用期提前转正</a></td>
<td width="50%" align="left">·<a href='http://ac.51job.com/phpAD/adtrace.php?ID=13330872' title='试用期新人控诉企业“四宗最”' style='color:#264f87;'  target='_blank'>试用期新人控诉企业“四宗最”</a></td></tr>
<tr><td width="50%" align="left">·<a href='http://ac.51job.com/phpAD/adtrace.php?ID=13330874' title='面试答好辞职原因有妙招！'  style='color:#264f87;'  target='_blank'>面试答好辞职原因有妙招！</a></td>
<td width="50%" align="left">·<a href='http://ac.51job.com/phpAD/adtrace.php?ID=13330875' title='如何摆脱“低薪族”？' style='color:#264f87;'  target='_blank'>如何摆脱“低薪族”？</a></td></tr>
<tr><td width="50%" align="left">·<a href='http://ac.51job.com/phpAD/adtrace.php?ID=12400256' title='转转乐：丰富好礼，一转既得'  style='color:#264f87;'  target='_blank'>转转乐：丰富好礼，一转既得</a></td>
<td width="50%" align="left">·<a href='http://ac.51job.com/phpAD/adtrace.php?ID=13148122' title='51club转转乐，闪亮钻戒近在咫尺' style='color:#264f87;'  target='_blank'>51club转转乐，闪亮钻戒近在咫尺</a></td></tr></table></div>

        </div>

        <div class="graybott">

          <span><img src="http://img01.51jobcdn.com/im/2009/graybl.gif" align="left"/></span>

          <span><img src="http://img01.51jobcdn.com/im/2009/graybr.gif" align="right"/></span>

        </div>

      </div><div class='jobs_com'><style type="text/css">

ul {

  margin: 0px;

  padding: 0px;

  clear:both;

}

#announcement {

  width:auto;

}

#announcement div {

  padding:0px 10px 0px 10px;

  overflow-y:hidden;

  line-height: 20px;

  height: 20px;

}

#announcement li {

  font-size: 12px;

  float: left;

  list-style-type: none;

  margin-right: 11px;

  margin-left: 5px;

  white-space: nowrap;

}

#announcement a {

  text-decoration: none;

  color:#9A9A9A;

}

#announcement a:hover {

  text-decoration:underline;

}

.st_one{

  margin-left:-22px;



}

</style>

<div class="area_list">

  <div class="graytop">

    <span><img align="left" src="http://img01.51jobcdn.com/im/2009/graytl.gif"></span>

    <span><img align="right" src="http://img01.51jobcdn.com/im/2009/graytr.gif"></span>

  </div>

  <div  id="announcement">

  <div class="grayline" id="announcementbody">

   <ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0100">北京招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0200">上海招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0302">广州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0400">深圳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2804">包头招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1602">石家庄招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0500">天津招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2102">太原招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2802">呼和浩特招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1604">保定招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1603">廊坊招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1606">秦皇岛招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1605">唐山招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2402">长春招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2303">大连招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2302">沈阳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2202">哈尔滨招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2403">吉林招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0702">南京招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1302">南昌招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0803">宁波招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0709">南通招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0705">常州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1203">青岛招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">泉州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0703">苏州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0805">绍兴招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1102">福州招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0808">台州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0704">无锡招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0804">温州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0802">杭州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1502">合肥招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">厦门招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0711">徐州招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1202">济南招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0807">嘉兴招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0806">金华招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1204">烟台招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0708">扬州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0706">昆山招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">漳州招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0710">镇江招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1208">临沂招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1503">芜湖招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1205">潍坊招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1206">威海招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0715">江阴招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0707">常熟招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0714">张家港招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0713">盐城招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0712">连云港招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0719">淮安招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0718">泰州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0809">湖州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0814">义乌招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1207">淄博招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1209">济宁招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1402">南宁招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1902">长沙招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0308">东莞招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1003">三亚招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1802">武汉招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1702">郑州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0307">中山招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0305">珠海招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1002">海口招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0306">佛山招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0303">惠州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0315">江门招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0304">汕头招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1703">洛阳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1803">宜昌招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1805">襄阳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1807">荆州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1903">株洲招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1905">衡阳招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1904">湘潭招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1907">常德招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0317">湛江招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0319">清远招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0325">顺德招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0902">成都招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0600">重庆招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2602">贵阳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2502">昆明招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0903">绵阳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=3102">乌鲁木齐招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2002">西安招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2702">兰州招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0100">北京人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0200">上海人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0302">广州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0400">深圳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2804">包头人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1602">石家庄人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0500">天津人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2102">太原人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2802">呼和浩特人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1604">保定人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1603">廊坊人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1606">秦皇岛人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1605">唐山人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2402">长春人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2303">大连人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2302">沈阳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2202">哈尔滨人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2403">吉林人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0702">南京人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1302">南昌人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0803">宁波人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0709">南通人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0705">常州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1203">青岛人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">泉州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0703">苏州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0805">绍兴人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1102">福州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0808">台州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0704">无锡人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0804">温州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0802">杭州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1502">合肥人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">厦门人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0711">徐州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1202">济南人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0807">嘉兴人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0806">金华人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1204">烟台人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0708">扬州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0706">昆山人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">漳州人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0710">镇江人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1208">临沂人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1503">芜湖人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1205">潍坊人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1206">威海人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0715">江阴人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0707">常熟人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0714">张家港人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0713">盐城人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0712">连云港人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0719">淮安人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0718">泰州人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0809">湖州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0814">义乌人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1207">淄博人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1209">济宁人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1402">南宁人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1902">长沙人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0308">东莞人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1003">三亚人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1802">武汉人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1702">郑州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0307">中山人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0305">珠海人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1002">海口人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0306">佛山人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0303">惠州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0315">江门人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0304">汕头人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1703">洛阳人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1803">宜昌人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1805">襄阳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1807">荆州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1903">株洲人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1905">衡阳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1904">湘潭人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1907">常德人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0317">湛江人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0319">清远人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0325">顺德人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0902">成都人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0600">重庆人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2602">贵阳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2502">昆明人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0903">绵阳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=3102">乌鲁木齐人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2002">西安人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2702">兰州人才网</a></li></ul></ul>  </div>

  </div>



  <div class="graybott">

    <span><img align="left" src="http://img01.51jobcdn.com/im/2009/graybl.gif"></span>

    <span><img align="right" src="http://img01.51jobcdn.com/im/2009/graybr.gif"></span>

  </div>

</div>

<script src="http://js.51jobcdn.com/in/js/2009/ScrollText.js" language="javascript"></script>

<script>

  if(document.getElementById("announcementbody")){

    var scrollup = new ScrollText("announcementbody");

    scrollup.Amount = 1;

    scrollup.Delay = 20;

    scrollup.Start();

  }

</script></div><div class="jobs_com">
  <div class="graybttop">
    <span><img src="http://img01.51jobcdn.com/im/2009/graybttl.gif" align="left"/></span>
    <span><img src="http://img01.51jobcdn.com/im/2009/graybttr.gif" align="right"/></span>
    <div class="btname"><img src="http://img01.51jobcdn.com/im/2009/search/c/wytjbt.gif" /></div>
  </div>
  <div class="grayline">
    <p class="graybttopbg"></p>
    <div class="jobs_txt"><table width="574" border="0" cellpadding="2" cellspacing="0" align="center">
<tr>
  <td><a href="http://ac.51job.com/phpAD/adtrace.php?ID=12400247" title="51club|爱工作，爱生活" target="_blank"><img src="http://img01.51jobcdn.com/im/images/2010/careerpost/51club/9030.gif" border="0" width="90" height="30"></a></td>
  <td width="2"></td>
  <td><a href="http://ac.51job.com/phpAD/adtrace.php?ID=13285095" title="上海于达信息技术有限公司" target="_blank"><img src="http://img02.51jobcdn.com/im/images/2011/bj/yuda0819a_8652wh.gif" border="0" width="90" height="30"></a></td>
  <td width="2"></td>
  <td><a href="http://ac.51job.com/phpAD/adtrace.php?ID=13286706" title="深圳市福田区创想时代职业培训学校" target="_blank"><img src="http://img02.51jobcdn.com/im/images/2012/shzh/chuangxiang0528a_8812wh.gif" border="0" width="90" height="30"></a></td>
  <td width="2"></td>
  <td colspan="5"></td>
</tr>
</table></div>
  </div>
  <div class="graybott">
    <span><img src="http://img01.51jobcdn.com/im/2009/graybl.gif" align="left"/></span>
    <span><img src="http://img01.51jobcdn.com/im/2009/graybr.gif" align="right"/></span>      
  </div>
</div></div></div></div><!--bottom start-->

<div id="bottom">

    <div id="bott">

    <ul class="btext">

      <li><a href="http://www.51job.com/bo/sitemap.php" target="_blank" onfocus="blur()">网站导航</a></li>

      <li>|</li>

      <li><a href="http://www.51job.com/bo/service.php" target="_blank" onfocus="blur()">服务声明</a></li>

      <li>|</li>

      <li><a href="http://www.51job.com/bo/contact.php" target="_blank" onfocus="blur()">联络我们</a></li>

      <li>|</li>

      <li><a href="http://www.51job.com/bo/AboutUs.php" target="_blank" onfocus="blur()">关于我们</a></li>

      <li>|</li>

      <li><a href="http://www.51job.com/bo/media/media.php" target="_blank" onfocus="blur()">媒体报道</a></li>

      <li>|</li>

      <li><a href="http://www.51job.com/vip/index.php" target="_blank" onfocus="blur()">加入无忧</a></li>

      <li>|</li>

      <li><a href="http://www.51job.com/hl/grjl.php" target="_blank" onfocus="blur()">帮助</a></li>

      <li>|</li>

      <li><a href="http://ir.51job.com" target="_blank" onfocus="blur()">Investor Relations</a></li>

      <li>|</li>

      <li><a href="http://www.51job.com/link.php" target="_blank" onfocus="blur()">合作伙伴</a></li>

    </ul>

  </div>

  <div id="copyright">

    <p class="fontright">人才招聘: 服务热线 400-886-0051 或Email:<a href="mailto:hr@51job.com" onfocus="blur()">hr@51job.com</a>　个人求职: Email:<a href="mailto:club@51job.com" onfocus="blur()">club@51job.com</a>　或垂询400-820-5100，800-820-5100</p>

    <p class="fontright">未经51job.com 同意，不得转载本网站之所有招聘信息及作品</p>

    <p class="fontright">无忧工作网版权所有&copy;1999-2012</p>

  </div>

  </div>

<!-- bottom end --></body>
</html>


<script language="javascript">

<!--

  window.cfg = {

    fileName: 'co_all_job.php' ,

    lang : 'c' ,

    stype : '' ,

    fullLang : 'Chinese' ,

    langs : { 

      sqzwml : 'applyjob' ,

      qzzwqdg : '请在要选择的职位前打勾!' ,

      myml : 'my' ,

      ts_qxjzw : '请选择职位' ,

      queren : '确认' ,

      guanbi : '关闭' ,

      nzdnxj : '您最多能选择' ,

      xiang : '项' ,

      xzdq : '选择地区' ,

      xj_xg : '选择/修改' ,

      zycs : '主要城市' ,

      sysf : '所有省份' ,

      buxian : '不限' ,

      qingxj : '请选择' ,

      yixuan : '已选' ,

      znlb : '职能类别' ,

      hylb : '行业类别' ,

      gzdd : '工作地点' ,

      quanbu : '全部' ,

      zhineng : '职能' ,

      hangye : '行业' ,

      didian : '地点' ,

      qsrgjz : '请输入关键字' ,

      srpcgjz : '输入排除关键字'

    } ,

    url : { 

      root : 'http://search.51job.com/jobsearch' ,

      image : 'http://img01.51jobcdn.com/im/2009' ,

      image_search : 'http://img01.51jobcdn.com/im/2009/search' ,

      image_search_lang : 'http://img01.51jobcdn.com/im/2009/search/c' ,

      image_search_c : 'http://img01.51jobcdn.com/im/2009/search/c' ,

      image_search_e : 'http://img01.51jobcdn.com/im/2009/search/e'

    } ,

    domain : {

      my : 'http://my.51job.com' ,

      search : 'http://search.51job.com'

    } ,

    isJobview : '1' ,

    isAcStatRecJob : '1' ,

    acStatRecJobType : '0803111457'

  };



  function searchInit() {

    if ( window.Search ) {

      clearInterval( intVal );

      window.zzSearch = new Search( { 

        searchForm : document.searchForm ,

        pageForm : document.pageForm ,

        excludeForm : document.excludeForm ,

        pageJumpForm : document.pageJumpForm ,

        selJobPageForm : document.selJobPageForm ,

        cfg : cfg

      } );

    }

  }

  var intVal = window.setInterval( searchInit , 50 );

//-->

</script>

<style type="text/css">

.font{ font-family:Arial, Helvetica, sans-serif;}

#message{ width:296px; font-size:12px; overflow:hidden;position:absolute;z-index:99999;}

.Left{ width:282px; float:left;padding-bottom:32767px; margin-bottom:-32767px;}

.Left .top{ width:282px; height:10px; background:url(http://img01.51jobcdn.com/im/2009/payservice/fans/top.gif) no-repeat; overflow:hidden;}

.Left .mid{ width:282px; background:url(http://img01.51jobcdn.com/im/2009/payservice/fans/mid.gif) repeat-y; }

.Left .mid .close{ width:12px; height:12px; float:right; margin-right:10px !important; margin-right:5px; margin-top:-3px;}

.Left .mid .content{ padding:10px 15px; color:#7f4e00; line-height:1.5em;}

.Left .bottom{ width:282px; height:14px; background:url(http://img01.51jobcdn.com/im/2009/payservice/fans/bottom.gif) no-repeat;}

.Right{ width:14px; height:16px; float:left;padding-bottom:32767px; margin-bottom:-32767px; background:url(http://img01.51jobcdn.com/im/2009/payservice/fans/jiantou2.gif)  no-repeat; margin-top:30px; margin-left:-1px;}

</style>

<div id="message" style="display:none">

  <div class="Left">

    <div class="top"></div>

    <div class="mid">

      <div class="close"><a href="javascript:;" onclick="closeTip('0', 'http://my.51job.com');$('#message').hide();"><img border="0" src="http://img01.51jobcdn.com/im/2009/payservice/fans/close.gif" /></a></div>

      <div class="content">新版企业粉丝团全新上线，找好工作的梦想不再是幻想，快来加入与企业对话！</div>

    </div>

    <div class="bottom"></div>

  </div>

    <div class="Right"></div>

</div>

<script language="JavaScript" type="text/javascript">

var obj1;

var sUrl     = 'http://my.51job.com' + '/payservice/fans/fans_ajax.php?jsoncallback=?';

var coidArr  = document.getElementsByName('coid');

var fansnum  = document.getElementById('fansnum');

if(fansnum){

  obj1 = $("#fansnum");

  width = 35;

  height = 8;

}else if(coidArr[0]){

  obj1 = $("#" + coidArr[0].value);

  width = 60;

  height = 13;

}

var obj2   = $("#message");

if(obj1){

  var offset = obj1.offset();

  document.getElementById('message').style.top  = offset.top - obj2.height() / 2 + obj1.height() / 5 + height + 'px';

  document.getElementById('message').style.left = offset.left - obj2.width() + width + 'px';

}

for(var i = 0;i < coidArr.length; i++){

  if(coidArr[i].value){

    var flg = 0;

    for(var j = 0;j < i; j++){

      if(coidArr[j].value && coidArr[i].value == coidArr[j].value){

        flg = 1;

        break;

      }

    }

    if(flg == 0){

      $.getJSON(sUrl, {type:'0',coid:coidArr[i].value,step:i}, function (data){

        var show_arr = data.compfans.split('|');

        show_status = '0';

        if(show_arr.length == 4 && show_arr[0] == '1'){

          show_status = '1';

        }

        var fansnum1 = document.getElementById(coidArr[data.index].value);

        if(fansnum){

          fansnum.innerHTML = data.searchData;

        }

        if(fansnum1){

          fansnum1.innerHTML = data.searchData;

        }

        if(show_status != '1' && document.getElementById('message').style.display == 'none'){

          document.getElementById('message').style.display = 'block';

        }

      });

    }

  }

}

</script>
HTML_str
class String  
    def br_to_new_line  
        self.gsub('<br>', "\n")  
    end  
    def strip_tag  
        self.gsub(%r[<[^>]*>], '')  
    end  
		def strip_all_tag
			self.gsub(%r[<.*>], '')
		end
		def strip_51job_tag
			self.gsub(%r[<br.*], '').gsub(%r[<[^>]*>], '')
		end
end #String 

  # 根据HTML分析出信息内容
  def parse_content_page_html(html)
 	  doc = Nokogiri::HTML(html)
		@name = doc.at_css('td.sr_bt').inner_html.strip_all_tag.to_s.strip
		@main = doc.css("table.jobs_1 tr")[1].inner_html.br_to_new_line.strip_tag
		@main += doc.at_css("p.txt_font").inner_html.br_to_new_line.strip_tag

  	rows = doc.css("p.txt_font1")
		#puts rows.length
		@details = rows.collect do |row|
		#	puts  row.inner_html.strip_all_tag
			detail = {}
			[
				[:name, 0],
				[:value, 1],
			].each do |name, cc|
				detail[name] = row.inner_html.strip_51job_tag.split(/[：]/)[cc]
			end
			detail
		end

   content_item = {}
    begin


    content_item[:name] = doc.at_css('td.sr_bt').text
      content_item[:description] = doc.at_css("p.txt_font").inner_html 
      content_item[:address] = nil
      content_item[:telephone] = nil
      content_item[:fax] = nil
      doc.css("p.txt_font1").each do |item|
        if item.text.strip[0] == "地"
          address = item.text.gsub(/具\.+/, '')
          content_item[:address] = address.strip.split(/：/)[1]
        end
        content_item[:telephone] = item.text.strip.split(/：/)[1] if item.text.strip[0] == "电"
        content_item[:fax] = item.text.strip.split(/：/)[1] if item.text.strip[0] == "传"
      end
    rescue
      puts 'error on parsing content page html'
    end
    return content_item
  end

#puts html
item = parse_content_page_html(html)
pp @name
pp @main
pp @details
puts "==============="
puts item[:name]
puts ""
puts item[:description]
puts ""
puts item[:address]
puts ""
puts item[:telephone]
puts ""
puts item[:fax]
