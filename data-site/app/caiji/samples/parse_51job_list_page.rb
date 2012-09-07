#encoding=utf-8

require 'nokogiri'

html=<<HTML_str

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>【北京招聘，求职】-前程无忧</title>
<meta name="description" content="前程无忧为您提供最新最全的北京招聘，求职信息。网聚全国各城市的人才信息，找好工作，找好员工，上前程无忧。">
<meta name="robots" content="all">
<link href="http://js.51jobcdn.com/in/css/style.css?20101230" rel="stylesheet" type="text/css" />
<link href="http://js.51jobcdn.com/in/css/logo.css?20101230" rel="stylesheet" type="text/css" />
<link href="http://js.51jobcdn.com/in/css/my.css?20101230" rel="stylesheet" type="text/css" />
<link href="http://js.51jobcdn.com/in/css/cisco.css?20101230" rel="stylesheet" type="text/css" />
<link href="http://js.51jobcdn.com/in/css/search.css?20110520" rel="stylesheet" type="text/css" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" media="screen" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" media="screen" />
<link rel="bookmark" href="/favicon.ico">
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/Base.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/Base.ZzLayer.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/Base.ZzLayer.ExtZzLayer.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/Base.ZzLayer.ExtZzLayer.JobLayer.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/Base.ZzLayer.ExtZzLayer.JobLayer.JobareaLayer.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/jobarea_array_c.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/Base.ZzLayer.ExtZzLayer.JobLayer.FuntypeLayer.js?20110520"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/funtype_array_c.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/Base.ZzLayer.ExtZzLayer.JobLayer.IndtypeLayer.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/indtype_array_c.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/search/Base.Search.js?20110301"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/payservice/GetCompetition.js?20110421"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/cv/CV_QuickApply.js?20120110"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/cv/CResume/CV_CMicroResume.js?20120111"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/Base.ZzLayer.ExtZzLayer.JobLayer.LowFuntypeLayer.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/jobarea_new_array_c.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/lowfuntype_array_c.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/search/iCom.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/search/search_key_words.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/search/dd_key_words_c.js?20120504"></script>
<script language="javascript" src="http://js.51jobcdn.com/in/js/2009/search/dd_functype_key_words_c.js?20120504"></script>
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

        <a href="http://search.51job.com/jobsearch/advance_search.php?lang=c&stype=2">高级搜索</a><br />&nbsp;<img src="http://img01.51jobcdn.com/im/2009/bbs/arrowt.gif" />

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



<span class="xqts"><b>小Q提示：</b>切勿同时申请同公司的多个职位，大部分HR对此很反感。</span></div>

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




<div class="maincenter" style="margin-bottom: 10px;"><div class="mainleft s_search">

  

  <div class="redtop">

    <span><img src="http://img01.51jobcdn.com/im/2009/redtl.gif" align="left" /></span>

    <span><img src="http://img01.51jobcdn.com/im/2009/redtr.gif" align="right" /></span>

  </div>



  <div class="redline">



    <div class="ss_text">

      <form name="searchForm" method="post" action="">

        <input type="hidden" name="lang" value="c">

        <input type="hidden" name="stype" value="2">

        <input type="hidden" name="postchannel" value="0000">

        <input type="hidden" name="fromType" value="1">

        <input type="hidden" name="line" value="">

        <input type="hidden" name="confirmdate" value="9">

        <div class="insearch2">



  <ul id="kwdTypeSel"><li valKey="2" class="kt_bg2" title="搜职位发布所有内容">全文</li><li valKey="1" class="kt_bg3" title="仅搜职位名关键字">职位名</li><li valKey="0" class="kt_bg3" title="仅搜公司名关键字">公司名</li></ul><input name="keywordtype" align="absmiddle" type="hidden" value="2" /><p><input name="keyword" maxlength="180" type="text" class="search9 kwdBold"  style=" color: #b5b5b5;width:395px"  value="请输入关键字" /></p><p><input type="button" align="absmiddle" name="btnJobarea"  value="北京"  class="anbg"/><input name="jobarea" type="hidden" class="selebg1" value="0100" /></p><p class="searchan"><input name="image" align="absmiddle" type="image" src="http://img01.51jobcdn.com/im/2009/search/c/jsearch.gif" align="middle"/>&nbsp;&nbsp;<img align="absmiddle" id="btnSearchInResult" src="http://img01.51jobcdn.com/im/2009/search/c/jgzss.gif" align="absmiddle" /></p>



  <div class="clearboth"></div>

  <div id="wrapSearchKeyWrods">

    <div style="margin-top:8px;display:none">

      <strong>相关关键字：</strong>

      <span id="searchKeyWrods"></span>

    </div>

  </div>

  <div class="pot"></div>

  <div class="clearboth"></div>



  

    <div class="sinTip">

    <ul id="ullist2" class="sinTipTxt">

      <li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="orange">销售</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">会计</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">行政</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="orange">司机</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">客服</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">物流</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">助理</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">采购</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="orange">java</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">人力资源</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">银行</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="orange">日语</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">设计</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">外贸</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="orange">计算机</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">电气</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">编辑</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">机械</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="orange">实习</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">财务</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">业务员</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="orange">房地产</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">医药代表</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">化妆品</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="orange">富士康</a></li><li class="rmssLi" style="display:inline"><a href="javascript: void(0);" onclick="zzSearch.hotKeywordSearch( this.innerHTML );return false;" class="blue">培训</a></li><li class="rmssLi" style="display:inline"><a href="http://www.51job.com/careerpost/jianlishuoming/index.php" target="_blank"  class="orange">简历指导</a></li><li class="rmssLi" style="display:inline"><a href="http://www.51job.com/careerpost/tiaocao/mianshi.php" target="_blank"  class="blue">面试技巧</a></li><li class="rmssLi" style="display:inline"><a href="http://www.51job.com/careerpost/tiaocao/tiaocao.php" target="_blank"  class="blue">跳槽策略</a></li><li class="rmssLi" style="display:inline"><a href="http://my.51job.com/payservice/translateresume/introduce.php" target="_blank"  class="blue">简历翻译</a></li>

    </ul>

    <div class="clearboth"></div>

    </div>

  <br />

  <div id="kwdAdvDispPot" class="pot" ></div><p >职能类别&nbsp;<input name="btnFuntype" value="选择/修改"  type="button" class="selebg1" align="absmiddle" />

<input name="funtype" type="hidden" class="selebg1" value="0000" />&nbsp;&nbsp;

行业类别&nbsp;<input name="btnIndustrytype" value="选择/修改"  type="button" class="selebg1" align="absmiddle" />

<input name="industrytype" type="hidden" class="selebg1" value="00" /></p>



</div>



<div class="adviceHelp"><img src="http://img01.51jobcdn.com/im/2009/search/q1.gif" align="absmiddle" /><a href="javascript:void(0);" onclick="zzSearch.openAdviceLayer();return false;" class="orange1">意见反馈</a><br/><img src="http://img01.51jobcdn.com/im/2009/search/q2.gif" align="absmiddle" /><a href="http://www.51job.com/hl/grjl.php" class="orange1" target="_blank">了解更多</a></div>



<div class="clearboth" style="height: 5px;"></div>

      </form>

    </div>



  </div>



  <div class="redbotts">

    <span><img src="http://img01.51jobcdn.com/im/2009/search/redbl.gif" align="left" height="14"/></span>

    <span class="close_s1" ><img onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=34&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();zzSearch.switchFunIndBtnDisp( this );" align="left"  src="http://img01.51jobcdn.com/im/2009/search/show.gif" width="43" height="14" /><img onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=34&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();zzSearch.switchFunIndBtnDisp( this );" align="left" style="display:none;" src="http://img01.51jobcdn.com/im/2009/search/show1.gif" width="43" height="14" /></span>

    <span><img src="http://img01.51jobcdn.com/im/2009/search/redbr.gif" align="right" height="14"/></span>

  </div>



</div><div class="mainleft s_search search_btm0"><table border=0 cellspacing=0 cellpadding=4><tr>
  <td><a href="http://ac.51job.com/phpAD/adtrace.php?ID=13284571" title="儒森教育" target="_blank" onfocus="blur()"><img src="http://img05.51jobcdn.com/im/images/2012/sh/rusen0104b_8673wh.gif" border="0" width="150" height="60"></a></td>
  <td><a href="http://ac.51job.com/phpAD/adtrace.php?ID=13320797" title="软件测试就业培训 往、应届毕业生" target="_blank" onfocus="blur()"><img src="http://img05.51jobcdn.com/im/images/2012/bj/quanjian0606_8819wh.gif" border="0" width="150" height="60"></a></td>
  <td><a href="http://ac.51job.com/phpAD/adtrace.php?ID=13241844" title="上海海润教育科技发展有限公司" target="_blank" onfocus="blur()"><img src="http://img05.51jobcdn.com/im/images/2012/sh/hairui0516_8818wh.gif" border="0" width="150" height="60"></a></td>
  <td><a href="http://ac.51job.com/phpAD/adtrace.php?ID=13242688" title="上海华育信息管理职业技术培训学校" target="_blank" onfocus="blur()"><img src="http://img05.51jobcdn.com/im/images/2012/sh/huayu0329b_8654wh.gif" border="0" width="150" height="60"></a></td>
  <td><a href="http://ac.51job.com/phpAD/adtrace.php?ID=13311202" title="联强国际贸易（中国）有限公司" target="_blank" onfocus="blur()"><img src="http://img05.51jobcdn.com/im/images/2010/gz/lianqiang0723_8182.gif" border="0" width="150" height="60"></a></td>
  <td><a href="http://ac.51job.com/phpAD/adtrace.php?ID=13274541" title="北京英才添翼科技有限公司" target="_blank" onfocus="blur()"><img src="http://img05.51jobcdn.com/im/images/2012/bj/yingcai0524_8784wh.gif" border="0" width="150" height="60"></a></td>
</tr>
</table></div><div class="mainleft s_search search_btm0 condDesc" ><img src="http://img01.51jobcdn.com/im/2009/search/searchbg1.gif" align="absmiddle">&nbsp;北京 + 近三天</div><div class="dibiao_line"><div class="s_search search_btm0 condDesc districtNav"><b><font color="#393939">北京地区：</font></b>&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" ><font color="#ff7300" style="font-weight:bold">所有</font></a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0101,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >东城区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0102,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >西城区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0103,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >崇文区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0104,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >宣武区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0105,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >朝阳区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0106,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >丰台区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0107,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >石景山区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0108,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >海淀区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0110,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >房山区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0111,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >通州区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0112,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >顺义区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0113,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >昌平区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0114,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >大兴区</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0109%252C0115%252C0116%252C0117%252C0118,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" >近郊</a></div><div class="s_search search_btm0 condDesc districtNav" id="Lineline"><b><font color="#393939">地铁沿线：</font></b>&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();zzSearch.ShowLine(0)"><font color="#ff7300" id="LineFont0" style="font-weight:bold">所有</font></a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="zzSearch.ShowLine(1)"><font id="LineFont1">地铁1号线</font></a></a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="zzSearch.ShowLine(2)"><font id="LineFont2">地铁2号线</font></a></a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="zzSearch.ShowLine(3)"><font id="LineFont3">地铁4号线</font></a></a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="zzSearch.ShowLine(4)"><font id="LineFont4">地铁5号线</font></a></a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="zzSearch.ShowLine(5)"><font id="LineFont5">地铁8号线</font></a></a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="zzSearch.ShowLine(6)"><font id="LineFont6">地铁10号线</font></a></a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="zzSearch.ShowLine(7)"><font id="LineFont7">地铁13号线</font></a></a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="zzSearch.ShowLine(8)"><font id="LineFont8">8通线</font></a></a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="zzSearch.ShowLine(9)"><font id="LineFont9">机场快线</font></a></a></div><div class="search_btm0 LineStop districtNav" id="Line1" style="border: 1px #999999 solid;display:none">&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C6%BB%B9%FB%D4%B0&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">苹果园</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%C5%B3%C7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">古城</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B0%CB%BD%C7%D3%CE%C0%D6%D4%B0&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">八角游乐园</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B0%CB%B1%A6%C9%BD&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">八宝山</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D3%F1%C8%AA%C2%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">玉泉路</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%E5%BF%C3%CB%C9&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">五棵松</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CD%F2%CA%D9%C2%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">万寿路</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%AB%D6%F7%B7%D8&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">公主坟</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BE%FC%CA%C2%B2%A9%CE%EF%B9%DD&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">军事博物馆</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C4%BE%E9%D8%B5%D8&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">木樨地</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C4%CF%C0%F1%CA%BF%C2%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">南礼士路</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B8%B4%D0%CB%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">复兴门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%B5%A5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西单</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CC%EC%B0%B2%C3%C5%CE%F7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">天安门西</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CC%EC%B0%B2%C3%C5%B6%AB&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">天安门东</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CD%F5%B8%AE%BE%AE&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">王府井</a><br>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B6%AB%B5%A5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">东单</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BD%A8%B9%FA%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">建国门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D3%C0%B0%B2%C0%EF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">永安里</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%FA%C3%B3&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">国贸</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B4%F3%CD%FB%C2%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">大望路</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CB%C4%BB%DD&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">四惠</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CB%C4%BB%DD%B6%AB&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA1%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">四惠东</a></div><div class="search_btm0 LineStop districtNav" id="Line2" style="border: 1px #999999 solid;display:none">&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%D6%B1%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西直门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B3%B5%B9%AB%D7%AF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">车公庄</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B8%B7%B3%C9%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">阜成门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B8%B4%D0%CB%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">复兴门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B3%A4%B4%BB%BD%D6&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">长椿街</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D0%FB%CE%E4%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">宣武门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BA%CD%C6%BD%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">和平门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C7%B0%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">前门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B3%E7%CE%C4%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">崇文门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B1%B1%BE%A9%D5%BE&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">北京站</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BD%A8%B9%FA%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">建国门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B3%AF%D1%F4%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">朝阳门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B6%AB%CB%C4%CA%AE%CC%F5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">东四十条</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B6%AB%D6%B1%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">东直门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D3%BA%BA%CD%B9%AC&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">雍和宫</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B0%B2%B6%A8%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">安定门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%C4%C2%A5%B4%F3%BD%D6&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">鼓楼大街</a><br>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BB%FD%CB%AE%CC%B6&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA2%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">积水潭</a></div><div class="search_btm0 LineStop districtNav" id="Line3" style="border: 1px #999999 solid;display:none">&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B0%B2%BA%D3%C7%C5%B1%B1&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">安河桥北</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B1%B1%B9%AC%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">北宫门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%D4%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西苑</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D4%B2%C3%F7%D4%B0&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">圆明园</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B1%B1%BE%A9%B4%F3%D1%A7%B6%AB%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">北京大学东门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D6%D0%B9%D8%B4%E5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">中关村</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BA%A3%B5%ED%BB%C6%D7%AF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">海淀黄庄</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C8%CB%C3%F1%B4%F3%D1%A7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">人民大学</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%BA%B9%AB%B4%E5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">魏公村</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%FA%BC%D2%CD%BC%CA%E9%B9%DD&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">国家图书馆</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B6%AF%CE%EF%D4%B0&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">动物园</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%D6%B1%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西直门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D0%C2%BD%D6%BF%DA&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">新街口</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C6%BD%B0%B2%C0%EF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">平安里</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%CB%C4&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西四</a><br>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C1%E9%BE%B3%BA%FA%CD%AC&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">灵境胡同</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%B5%A5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西单</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D0%FB%CE%E4%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">宣武门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B2%CB%CA%D0%BF%DA&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">菜市口</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CC%D5%C8%BB%CD%A4&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">陶然亭</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B1%B1%BE%A9%C4%CF%D5%BE&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">北京南站</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C2%ED%BC%D2%B1%A4&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">马家堡</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BD%C7%C3%C5%CE%F7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">角门西</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%AB%D2%E6%CE%F7%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA4%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">公益西桥</a></div><div class="search_btm0 LineStop districtNav" id="Line4" style="border: 1px #999999 solid;display:none">&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CC%EC%CD%A8%D4%B7%B1%B1&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">天通苑北</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CC%EC%CD%A8%D4%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">天通苑</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CC%EC%CD%A8%D4%B7%C4%CF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">天通苑南</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C1%A2%CB%AE%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">立水桥</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C1%A2%CB%AE%C7%C5%C4%CF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">立水桥南</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B1%B1%D4%B7%C2%B7%B1%B1&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">北苑路北</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B4%F3%CD%CD%C2%B7%B6%AB&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">大屯路东</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BB%DD%D0%C2%CE%F7%BD%D6%B1%B1%BF%DA&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">惠新西街北口</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BB%DD%D0%C2%CE%F7%BD%D6%C4%CF%BF%DA&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">惠新西街南口</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BA%CD%C6%BD%CE%F7%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">和平西桥</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BA%CD%C6%BD%C0%EF%B1%B1%BD%D6&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">和平里北街</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D3%BA%BA%CD%B9%AC&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">雍和宫</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B1%B1%D0%C2%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">北新桥</a><br>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D5%C5%D7%D4%D6%D2%C2%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">张自忠路</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B6%AB%CB%C4&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">东四</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B5%C6%CA%D0%BF%DA&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">灯市口</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B6%AB%B5%A5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">东单</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B3%E7%CE%C4%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">崇文门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B4%C5%C6%F7%BF%DA&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">磁器口</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CC%EC%CC%B3%B6%AB%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">天坛东门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C6%D1%BB%C6%D3%DC&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">蒲黄榆</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C1%F5%BC%D2%D2%A4&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">刘家窑</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CB%CE%BC%D2%D7%AF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA5%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">宋家庄</a></div><div class="search_btm0 LineStop districtNav" id="Line5" style="border: 1px #999999 solid;display:none">&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C9%AD%C1%D6%B9%AB%D4%B0%C4%CF%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA8%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">森林公园南门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B0%C2%C1%D6%C6%A5%BF%CB%B9%AB%D4%B0&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA8%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">奥林匹克公园</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B0%C2%CC%E5%D6%D0%D0%C4&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA8%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">奥体中心</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B1%B1%CD%C1%B3%C7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA8%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">北土城</a></div><div class="search_btm0 LineStop districtNav" id="Line6" style="border: 1px #999999 solid;display:none">&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B0%CD%B9%B5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">巴沟</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CB%D5%D6%DD%BD%D6&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">苏州街</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BA%A3%B5%ED%BB%C6%D7%AF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">海淀黄庄</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D6%AA%B4%BA%C0%EF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">知春里</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D6%AA%B4%BA%C2%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">知春路</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%CD%C1%B3%C7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西土城</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C4%B5%B5%A4%D4%B0&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">牡丹园</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BD%A1%B5%C2%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">健德门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B1%B1%CD%C1%B3%C7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">北土城</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B0%B2%D5%EA%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">安贞门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BB%DD%D0%C2%CE%F7%BD%D6%C4%CF%BF%DA&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">惠新西街南口</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C9%D6%D2%A9%BE%D3&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">芍药居</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CC%AB%D1%F4%B9%AC&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">太阳宫</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C8%FD%D4%AA%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">三元桥</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C1%C1%C2%ED%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">亮马桥</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C5%A9%D2%B5%D5%B9%C0%C0%B9%DD&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">农业展览馆</a><br>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CD%C5%BD%E1%BA%FE&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">团结湖</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BA%F4%BC%D2%C2%A5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">呼家楼</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BD%F0%CC%A8%CF%A6%D5%D5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">金台夕照</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%FA%C3%B3&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">国贸</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CB%AB%BE%AE&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">双井</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BE%A2%CB%C9&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA10%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">劲松</a></div><div class="search_btm0 LineStop districtNav" id="Line7" style="border: 1px #999999 solid;display:none">&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%D6%B1%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西直门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B4%F3%D6%D3%CB%C2&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">大钟寺</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D6%AA%B4%BA%C2%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">知春路</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%E5%B5%C0%BF%DA&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">五道口</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C9%CF%B5%D8&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">上地</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%B6%FE%C6%EC&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西二旗</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C1%FA%D4%F3&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">龙泽</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BB%D8%C1%FA%B9%DB&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">回龙观</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BB%F4%D3%AA&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">霍营</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C1%A2%CB%AE%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">立水桥</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B1%B1%D4%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">北苑</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CD%FB%BE%A9%CE%F7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">望京西</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C9%D6%D2%A9%BE%D3&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">芍药居</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%E2%CE%F5%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">光熙门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C1%F8%B7%BC&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">柳芳</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B6%AB%D6%B1%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%B5%D8%CC%FA13%BA%C5%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">东直门</a></div><div class="search_btm0 LineStop districtNav" id="Line8" style="border: 1px #999999 solid;display:none">&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CB%C4%BB%DD&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">四惠</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CB%C4%BB%DD%B6%AB&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">四惠东</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B8%DF%B1%AE%B5%EA&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">高碑店</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B4%AB%C3%BD%B4%F3%D1%A7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">传媒大学</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CB%AB%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">双桥</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%DC%D7%AF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">管庄</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B0%CB%C0%EF%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">八里桥</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B1%B1%D4%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">北苑</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%FB%D4%B0&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">果园</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BE%C5%BF%C3%CA%F7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">九棵树</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C0%E6%D4%B0&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">梨园</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C1%D9%BA%D3%C0%EF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">临河里</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CD%C1%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=8%CD%A8%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">土桥</a></div><div class="search_btm0 LineStop districtNav" id="Line9" style="border: 1px #999999 solid;display:none">&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B6%AB%D6%B1%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%BB%FA%B3%A1%BF%EC%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">东直门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C8%FD%D4%AA%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%BB%FA%B3%A1%BF%EC%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">三元桥</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=T3%BA%BD%D5%BE%C2%A5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%BB%FA%B3%A1%BF%EC%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">T3航站楼</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=T2%BA%BD%D5%BE%C2%A5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17&line=%BB%FA%B3%A1%BF%EC%CF%DF" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=36&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">T2航站楼</a></div><div class="s_search search_btm0 dibiaoDesc districtNav"><b><font color="#393939">热门地标：</font></b>&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();"><font color="#ff7300" style="font-weight:bold">所有</font></a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=CBD&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">CBD</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BD%F0%C8%DA%BD%D6&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">金融街</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D6%D0%B9%D8%B4%E5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">中关村</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D1%E0%C9%AF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">燕莎</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C2%ED%B5%E9&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">马甸</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%AB%D6%F7%B7%D8&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">公主坟</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B3%AF%CD%E2&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">朝外</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D1%C7%D4%CB%B4%E5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">亚运村</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C9%CF%B5%D8&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">上地</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CD%FB%BE%A9&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">望京</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B6%AB%D6%B1%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">东直门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CA%AF%BE%B0%C9%BD&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">石景山</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%D6%B1%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西直门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D2%E0%D7%AF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">亦庄</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BD%A8%B9%FA%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">建国门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C8%FD%D4%AA%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">三元桥</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CD%F5%B8%AE%BE%AE&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">王府井</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BE%C6%CF%C9%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">酒仙桥</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id="more" style="display:; text-decoration:none; color:#FF7300;" onclick="zzSearch.showMore(1);" href="javascript:void(0);">更多︾</a><span id="moreDibao" style="display:none"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%B5%A5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西单</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D6%AA%B4%BA%C2%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">知春路</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B9%FA%D5%B9%D6%D0%D0%C4&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">国展中心</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B5%C2%CA%A4%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">德胜门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BA%CD%C6%BD%C0%EF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">和平里</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CA%C0%C3%B3%CC%EC%BD%D7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">世贸天阶</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%E5%BF%C3%CB%C9&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">五棵松</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D7%CF%D6%F1%C7%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">紫竹桥</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%BE%B2%B0%B2%D7%AF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">静安庄</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B1%B1%CC%AB%C6%BD%D7%AF&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">北太平庄</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B3%AF%D1%F4%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">朝阳门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C9%D6%D2%A9%BE%D3&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">芍药居</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%C8%FD%C0%EF%CD%CD&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">三里屯</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%D1%A7%D4%BA%C2%B7&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">学院路</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B3%E7%CE%C4%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">崇文门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CD%C5%BD%E1%BA%FE&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">团结湖</a><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B8%B7%B3%C9%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">阜成门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CB%C4%BB%DD&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">四惠</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B0%B2%B6%A8%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">安定门</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%CE%F7%B0%D3%BA%D3&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">西坝河</a>&nbsp;&nbsp;<a href="http://search.51job.com/list/0100,0100,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&address=%B8%B4%D0%CB%C3%C5&lonlat=0%2C0&radius=0.03&ord_field=0&list_type=0&confirmdate=9&fromType=17" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=35&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();">复兴门</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="zzSearch.showMore(0);" href="javascript:void(0);" style="text-decoration:none; color:#FF7300;">收起︽</a></span></div></div><div class="mainleft"><div style="height:1px;"><a name="map_top"><div></div></a></div>

<div class="search_left">



  <div class="bline_search zjjzss_kb">

    <form name="excludeForm" method="post" action="">

      <p class="bt_re">在结果中筛选</p>

      <p class="bt_pc1">排除&nbsp;<input align="absmiddle" style="width:115px" type="text" name="keyword" value="输入排除关键字" maxlength="100" /></p>

      <p class="bt_pc"><input name="image" type="image" src="http://img01.51jobcdn.com/im/2009/search/c/pc.gif" align="middle" /></p>

    </form>

  </div>



  <div class="bline_search">

    <div class="refineNavOn" onclick="zzSearch.switchRefineMenu( this );">工作年限</div><div class="refineMenu"><ul><li><a  class="high"  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9?fromType=6">所有</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=1&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=6">在读学生(639)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=2&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=6">应届毕业生(3301)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=3&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=6">一年以上(24178)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=4&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=6">二年以上(19304)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=5&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=6">三年以上(18350)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=6&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=6">五年以上(8438)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=7&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=6">八年以上(1178)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=8&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=6">十年以上(724)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=9&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=6">不限(23888)</a></li></ul></div><div class="refineNavOn" onclick="zzSearch.switchRefineMenu( this );">发布日期</div><div class="refineMenu"><ul><li><a  href="http://search.51job.com/list/0100,0000,0000,00,9,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9?fromType=5">所有</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,1,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=5">近一天(100000)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,2,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=5">近二天(100000)</a></li><li><a  class="high"  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=5">近三天(100000)</a></li></ul></div><div class="refineNavOn" onclick="zzSearch.switchRefineMenu( this );">学历要求</div><div class="refineMenu"><ul><li><a  class="high"  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9?fromType=7">所有</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=1&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=7">初中(614)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=2&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=7">高中(3457)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=3&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=7">中技(701)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=4&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=7">中专(3890)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=5&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=7">大专(37053)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=6&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=7">本科(38181)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=7&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=7">硕士(1640)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=8&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=7">博士(82)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=9&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=7">其他(380)</a></li></ul></div><div class="refineNavOn" onclick="zzSearch.switchRefineMenu( this );">公司性质</div><div class="refineMenu"><ul><li><a  class="high"  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9?fromType=8">所有</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=01&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=8">外资(欧美)(8942)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=02&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=8">外资(非欧美)(5170)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=03&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=8">合资(欧美)(3304)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=04&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=8">合资(非欧美)(5583)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=05&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=8">国企(4013)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=06&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=8">民营公司(58298)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=07&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=8">外企代表处(268)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=09&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=8">政府机关(5)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=10&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=8">事业单位(644)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=11&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=8">非盈利机构(247)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=08&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=8">其它性质(13526)</a></li></ul></div><div class="refineNavOn" onclick="zzSearch.switchRefineMenu( this );">月薪范围</div><div class="refineMenu"><ul><li><a  class="high"  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9?fromType=21">所有</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,00,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">面议(82497)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,01,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">1500以下(69)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,02,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">1500-1999(480)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,03,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">2000-2999(3617)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,04,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">3000-4499(4732)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,05,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">4500-5999(3712)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,06,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">6000-7999(1998)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,07,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">8000-9999(1222)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,08,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">10000-14999(1174)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,09,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">15000-19999(269)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,10,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">20000-29999(105)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,11,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">30000-49999(41)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,12,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=21">50000及以上(84)</a></li></ul></div><div class="refineNavOn" onclick="zzSearch.switchRefineMenu( this );">工作类型</div><div class="refineMenu"><ul><li><a  class="high"  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9?fromType=22">所有</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=0&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=22">全职(99205)</a></li><li><a  href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=1&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=22">兼职(795)</a></li></ul></div>

  </div>

  <p><a href="http://my.51job.com/my/My_SearchManage.php" target="_blank"><img src="http://img01.51jobcdn.com/im/2009/search/c/yjdyan.gif" /></a><a href="http://my.51job.com/rss/Rss001.php" target="_blank"><img src="http://img01.51jobcdn.com/im/2009/search/c/rssdyan.gif" /></a></p>

  <div>

    <a href="http://ac.51job.com/phpAD/adtrace.php?ID=12399818" title="51club&#124;爱工作，爱生活" target="_blank"><img src="http://img01.51jobcdn.com/im/images/2010/careerpost/51club/156220.gif" width="156" height="220"/></a><div><img src="http://www.51job.com/ex/page_view.php/adid=12399818" width="0" height="0" border="0"/></div>

  </div>

</div> <div class="search_right resultRight">

    <div class="resultTopNav">

      <table cellpadding="0" cellspacing="0" class="resultNav">

        <tr>

          <td class="resultTopNavLeft">

          <div class="sortByFloatMarginLeft"><span>排序方式：</span><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9&fromType=11" title="按更新时间排序"><img src="http://img01.51jobcdn.com/im/2009/search/gray_agxr.gif" align="absmiddle" /></a></div><div class="sortByFloatMarginLeft"><div id="sfrqTabContent" class="TabContent" style="display:none;margin-top:22px;"><ul>

             <li><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=1&fromType=37">一天首发</a></li>

             <li><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=2&fromType=38">三天首发</a></li>

             <li><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=3&fromType=39">一周首发</a></li>

             <li><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=4&fromType=40">两周首发</a></li>       

                   </ul></div><img src="http://img01.51jobcdn.com/im/2009/search/blue_asfr.gif" align="absmiddle" title="按首发日排序" style="cursor:pointer;" onclick="$('#sfrqTabContent').css('display','inline');"/></div><div class="sortByFloatMarginLeft"><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=1&list_type=0&confirmdate=9&fromType=10" title="按相关度排序"><img src="http://img01.51jobcdn.com/im/2009/search/blue_axgd.gif" align="absmiddle" /></a></div></td>

          <td align="right" nowrap="nowrap">

            <table><tr><td>

            <span>查看方式：</span><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=1&list_type=0&confirmdate=9" title="按列表查看" onclick="zzSearch.pageFormSub( { list_type : 0 , fromType : 13 , curr_page : 1 } );return false;"><img src="http://img01.51jobcdn.com/im/2009/search/tb3.gif" align="absmiddle" /></a>

            <a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,1.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=1&list_type=1&confirmdate=9" title="按明细查看" onclick="zzSearch.pageFormSub( { list_type : 1 , fromType : 12 , curr_page : 1 } );return false;"><img src="http://img01.51jobcdn.com/im/2009/search/tb4.gif" align="absmiddle" /></a>

            <img src="http://img01.51jobcdn.com/im/2009/search/fy_line.gif" align="absmiddle"/></td>

            <td nowrap="nowrap">

            <table  class="navBold" ><tr><td  style="padding-right:5px;" ><img src="http://img01.51jobcdn.com/im/2009/pageloff.gif" border="0" /></td><td>1-30 / 100000</td><td><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,2.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9"  class="orange1"  onclick="zzSearch.jumpPage( this.href );return false;"  style="border:0px; width:auto;margin-left:5px;" ><img src="http://img01.51jobcdn.com/im/2009/pageron.gif" border="0" /></a></td></tr></table>

            </td></tr></table>

          </td>

        </tr>

      </table>

    </div>

      <div class="resultListDiv">

        <table id="resultList" class="resultList resultListWide" cellpadding="0" cellspacing="0">

      <tr class="titleTr">

        <td  class="td0">&nbsp;</td>

        <td  class="td1">职位名称</td>

        <td  class="td2">公司名称</td>

        <td  class="td3">工作地点</td>

        <td  class="td4">更新日</td>

        <td  class="td5">&nbsp;</td>

      </tr>

      <tr><td colspan="6" style="height:2px;"></td></tr>

      

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid51160594" value="51160594" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160594,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >生物信息部高级经理</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,210157,0000,10,1.html" class="coname" target="_blank" >北京诺赛基因组研究中心有限公司</a></td>



        <td class="td3"><span id="map_jobarea51160594">北京</span></td>



        <td class="td4"><span id="map_fbrq51160594">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：硕士&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：三年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司规模50-150人

        </td>

        

        <td class="td5">

          <a id="jobappli_51160594" onclick="zzSearch.jobview( '51160594' );QuickApply(51160594,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160594">工作职能： 1、组建生物信息部门工作团队，完善部门管理制度； 2、全面负责生物信息及高通量测序工作的技术开发和日常管理工作； 3、建立及完善试验技术和操作流程； 4、完成公司下达的生物信息及高通量测序任务指标。 任职资格： 1.生物...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160594' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160594',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid51160584" value="51160584" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160584,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >销售代表</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2754630,0000,10,1.html" class="coname" target="_blank" >北京存知行商贸有限公司</a></td>



        <td class="td3"><span id="map_jobarea51160584">北京-朝阳区</span></td>



        <td class="td4"><span id="map_fbrq51160584">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：一年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模少于50人

        </td>

        

        <td class="td5">

          <a id="jobappli_51160584" onclick="zzSearch.jobview( '51160584' );QuickApply(51160584,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160584">岗位职责 1、负责所辖区域的新客户开拓，客户信息的搜集； 2、定期拜访客户，销售公司产品； 3、与客户进行沟通，及时掌握客户需要，了解客户状态； 4、定期对客户档案进行分析、整理，提供销售分析数据； 5、接受客户投诉，妥善解决问题...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160584' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160584',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid51160329" value="51160329" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160329,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >消防中控员（警卫勤务）</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2461816,0000,10,1.html" class="coname" target="_blank" >北京清华医院</a></td>



        <td class="td3"><span id="map_jobarea51160329">北京</span></td>



        <td class="td4"><span id="map_fbrq51160329">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：无要求&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：国企&nbsp;&nbsp;|&nbsp;&nbsp;公司规模500人以上

        </td>

        

        <td class="td5">

          <a id="jobappli_51160329" onclick="zzSearch.jobview( '51160329' );QuickApply(51160329,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160329">岗位职责：警卫勤务警卫安全维护勤务、巡逻勤务、过磅及中控消防作业，采三班制出勤，休假方式为轮休。应聘要求男，年龄35周岁以下、身高170cm以上、高中（中专）以上学历、无不良前科纪录及刺青、持有消防中控证者优先。</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160329' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160329',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid51160571" value="51160571" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160571,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >零售督导</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2370926,0000,10,1.html" class="coname" target="_blank" >北京极地阳光户外用品有限公司</a></td>



        <td class="td3"><span id="map_jobarea51160571">北京-朝阳区</span></td>



        <td class="td4"><span id="map_fbrq51160571">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：二年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模150-500人

        </td>

        

        <td class="td5">

          <a id="jobappli_51160571" onclick="zzSearch.jobview( '51160571' );QuickApply(51160571,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160571">1、负责ICEPEAK北京直营零售店管理。2、较强的语言沟通能力、抗压能力。3、具有独立完成对一线销售人员的培训能力。4、有户外品牌工作经验者优先。5、年龄在25岁以上。</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160571' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160571',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid51160508" value="51160508" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160508,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >行政综合</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2452472,0000,10,1.html" class="coname" target="_blank" >杭州友华通信工程设计有限公司</a></td>



        <td class="td3"><span id="map_jobarea51160508">北京</span></td>



        <td class="td4"><span id="map_fbrq51160508">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：无要求&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模500人以上

        </td>

        

        <td class="td5">

          <a id="jobappli_51160508" onclick="zzSearch.jobview( '51160508' );QuickApply(51160508,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160508">工作内容：1、协助领导完成项目部行政事务；2、负责固定资产管理及办公室日常维护；3、做好会前准备、会议记录及会后整理等会务工作；4、负责项目部日常的报表汇总、分析工作；5、辅助项目经理和人事部门做好各项工作的后勤支援；6、领导...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160508' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160508',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid51066648" value="51066648" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51066648,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >销售助理</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2774896,0000,10,1.html" class="coname" target="_blank" >北京磊数科技有限公司</a></td>



        <td class="td3"><span id="map_jobarea51066648">北京-海淀区</span></td>



        <td class="td4"><span id="map_fbrq51066648">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：一年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司规模少于50人

        </td>

        

        <td class="td5">

          <a id="jobappli_51066648" onclick="zzSearch.jobview( '51066648' );QuickApply(51066648,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51066648">工作职责：1、负责公司销售合同及其他营销文件资料的管理、归类、整理、建档和保管工作。 2、负责各类销售指标的月度、季度、年度统计报表和报告的制作、编写，并随时答复领导对销售动态情况的质询。 3、负责收集、整理、归纳市场行情、价...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51066648' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51066648',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid50862254" value="50862254" ></td>



        <td class="td1"><a href="http://search.51job.com/job/50862254,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >售后支持/服务</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2774896,0000,10,1.html" class="coname" target="_blank" >北京磊数科技有限公司</a></td>



        <td class="td3"><span id="map_jobarea50862254">北京-海淀区</span></td>



        <td class="td4"><span id="map_fbrq50862254">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：一年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司规模少于50人

        </td>

        

        <td class="td5">

          <a id="jobappli_50862254" onclick="zzSearch.jobview( '50862254' );QuickApply(50862254,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo50862254">工作职责：  1、负责公司产品售前、售后的技术支持工作。   2、负责公司产品的部署和维护。   3、熟悉网络、打印机等外设，能够为客户解决问题。  岗位要求： 1、大专以上学历，计算机及相关专业。 2、具有一年以上系统维护或外设管理经验...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '50862254' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('50862254',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid50727820" value="50727820" ></td>



        <td class="td1"><a href="http://search.51job.com/job/50727820,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >销售人员</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2774896,0000,10,1.html" class="coname" target="_blank" >北京磊数科技有限公司</a></td>



        <td class="td3"><span id="map_jobarea50727820">北京-海淀区</span></td>



        <td class="td4"><span id="map_fbrq50727820">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：一年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司规模少于50人

        </td>

        

        <td class="td5">

          <a id="jobappli_50727820" onclick="zzSearch.jobview( '50727820' );QuickApply(50727820,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo50727820">一，岗位职责：  　　1、负责产品的市场渠道开拓与销售工作，执行并完成产品年度销售计划。   　　2、根据公司市场营销战略，提升销售价值，控制成本，扩大产品在所负责区域的销售，积极完成销售量指标，扩大产品市场占有率；  　　3、与...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '50727820' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('50727820',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid43565087" value="43565087" ></td>



        <td class="td1"><a href="http://search.51job.com/job/43565087,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >行政助理（兼出纳）</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2422359,0000,10,1.html" class="coname" target="_blank" >北京兴德通医药科技有限公司</a></td>



        <td class="td3"><span id="map_jobarea43565087">北京-朝阳区</span></td>



        <td class="td4"><span id="map_fbrq43565087">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：本科&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：无要求&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模少于50人

        </td>

        

        <td class="td5">

          <a id="jobappli_43565087" onclick="zzSearch.jobview( '43565087' );QuickApply(43565087,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo43565087">岗位职责： 1.公司资产及办公设备管理。 2.办公用品管理、差旅预订服务及办公环境管理； 3.协助行政总监做好公司人事管理工作、包括人员招聘、入职、离职手续、社保及公积金开户、增减员等相关工作。 4.行政接待及服务工作； 5.协助会计进...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '43565087' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('43565087',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid51160066" value="51160066" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160066,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >人事主管</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2529991,0000,10,1.html" class="coname" target="_blank" >东研环保（中国）运营总部</a></td>



        <td class="td3"><span id="map_jobarea51160066">北京-朝阳区</span></td>



        <td class="td4"><span id="map_fbrq51160066">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：五年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司规模500人以上

        </td>

        

        <td class="td5">

          <a id="jobappli_51160066" onclick="zzSearch.jobview( '51160066' );QuickApply(51160066,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160066">工作职责：1、参与制定人力资源战略规划，为重大人事决策提供建议和信息支持；2、组织制定、执行、监督公司人事管理制度；3、协助人事行政经理做好相应的职位说明书，并根据公司职位调整需要进行相应的变更，保证岗位职责说明书与实际相符...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160066' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160066',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid51160514" value="51160514" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160514,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >库存管理专员</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2560684,0000,10,1.html" class="coname" target="_blank" >万瑞和贸易（北京）有限公司</a></td>



        <td class="td3"><span id="map_jobarea51160514">北京-朝阳区</span></td>



        <td class="td4"><span id="map_fbrq51160514">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：高中&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：二年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模50-150人

        </td>

        

        <td class="td5">

          <a id="jobappli_51160514" onclick="zzSearch.jobview( '51160514' );QuickApply(51160514,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160514">工作性质：全职工作地点：北京工作经验：2年以上库房管理经验待　　遇：基本工资+奖金+社会保险有效时间：长期招聘岗位要求：1、22岁-40岁，高中以上学历，有丰富库存管理经验者可放宽；2、2年以上库房管理工作经验，有葡萄酒库存管理经验...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160514' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160514',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid51160536" value="51160536" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160536,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >工程部经理</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,102387,0000,10,1.html" class="coname" target="_blank" >汉能控股集团有限公司</a></td>



        <td class="td3"><span id="map_jobarea51160536">北京</span></td>



        <td class="td4"><span id="map_fbrq51160536">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：本科&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：五年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模500人以上

        </td>

        

        <td class="td5">

          <a id="jobappli_51160536" onclick="zzSearch.jobview( '51160536' );QuickApply(51160536,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160536">岗位关键职责： ■ 根据汉能地产公司战略发展目标，贯彻、执行决策层方针和指示并达到公司确定的目标。 ■ 统筹安排市场策划部的全面建设和管理工作。 ■  熟悉房地产工程管理工作及程序，具有一定的实际工作能力。 ■ 协调本部门与集团各...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160536' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160536',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid51160525" value="51160525" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160525,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >商务专员</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2794144,0000,10,1.html" class="coname" target="_blank" >北京旌旗智远商业经纪有限公司</a></td>



        <td class="td3"><span id="map_jobarea51160525">北京-西城区</span></td>



        <td class="td4"><span id="map_fbrq51160525">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：无要求&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模50-150人

        </td>

        

        <td class="td5">

          <a id="jobappli_51160525" onclick="zzSearch.jobview( '51160525' );QuickApply(51160525,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160525">公司描述北京旌旗智远商业经纪有限公司为北京市集团性质的公司，是新疆海川新盟商品交易股份有限公司驻北京办事处。同时也为山东寿光蔬菜产业集团（天津）商品交易所在北京地区服务中心。公司秉承积极、奋进、仁爱、团结的经营理念，立足...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160525' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160525',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid51160197" value="51160197" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160197,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >行政专员、行政助理、人事专员、人事助理</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2797506,0000,10,1.html" class="coname" target="_blank" >北京华夏安邦国际贸易有限公司</a></td>



        <td class="td3"><span id="map_jobarea51160197">北京</span></td>



        <td class="td4"><span id="map_fbrq51160197">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：中专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：无要求&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模50-150人

        </td>

        

        <td class="td5">

          <a id="jobappli_51160197" onclick="zzSearch.jobview( '51160197' );QuickApply(51160197,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160197">行政专员、行政助理、月薪2400元——3400元左右，正常班，双休，（五险一金）包食宿。岗位职责：1、起草和修改报告、文稿等； 2、及时准确的更新员工通讯录；管理公司网络、邮箱； 3、负责日常办公用品采购、发放、登记管理，办公室设备管...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160197' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160197',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid50210904" value="50210904" ></td>



        <td class="td1"><a href="http://search.51job.com/job/50210904,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >网络编辑</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2587265,0000,10,1.html" class="coname" target="_blank" >北京同济医院有限公司</a></td>



        <td class="td3"><span id="map_jobarea50210904">北京-东城区</span></td>



        <td class="td4"><span id="map_fbrq50210904">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：无要求&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模500人以上

        </td>

        

        <td class="td5">

          <a id="jobappli_50210904" onclick="zzSearch.jobview( '50210904' );QuickApply(50210904,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo50210904">【招聘职位及要求】  1、有医疗网络编辑、专题制作和网络文章撰写工作经验；  2、熟悉医疗行业网站策划、网络编辑，网络推广运营模式；  3、了解SEO工作原理。  4、扎实的文字功底。  5、良好的工作心态和团队意识。  要求：有意者请携带...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '50210904' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('50210904',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid49751429" value="49751429" ></td>



        <td class="td1"><a href="http://search.51job.com/job/49751429,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >经理助理</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2065401,0000,10,1.html" class="coname" target="_blank" >裕华通设计</a></td>



        <td class="td3"><span id="map_jobarea49751429">北京-朝阳区</span></td>



        <td class="td4"><span id="map_fbrq49751429">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：三年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模少于50人

        </td>

        

        <td class="td5">

          <a id="jobappli_49751429" onclick="zzSearch.jobview( '49751429' );QuickApply(49751429,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo49751429">1、协助执行各项计划，控制质量和进度； 2、进行公司日常管理工作，协调员工的分工关系； 3、执行成本核算和统计，进行成本管理； 4、整理归档公司的日常合同、资料、文档； 5、对平面设计、印刷有所了解，熟练使用办公软件 6、五年以上管...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '49751429' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('49751429',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid51160484" value="51160484" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160484,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >前台接待主管</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2402982,0000,10,1.html" class="coname" target="_blank" >北京银龙苑宾馆</a></td>



        <td class="td3"><span id="map_jobarea51160484">北京-西城区</span></td>



        <td class="td4"><span id="map_fbrq51160484">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：一年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：国企&nbsp;&nbsp;|&nbsp;&nbsp;公司规模150-500人

        </td>

        

        <td class="td5">

          <a id="jobappli_51160484" onclick="zzSearch.jobview( '51160484' );QuickApply(51160484,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160484">职位要求：  1、大专以上学历，女性，年龄25-35岁，酒店相关岗位1年以上工作经验； 2、形象气质佳，沟通能力强； 3、熟悉前厅服务人员的培训与激励； 4、工作热情积极、细致耐心，具有良好的沟通能力、协调能力  5、熟练使用各种办公自动...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160484' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160484',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid51160480" value="51160480" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160480,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >综合部经理</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2570790,0000,10,1.html" class="coname" target="_blank" >芯联达科技（北京）有限公司</a></td>



        <td class="td3"><span id="map_jobarea51160480">北京-海淀区</span></td>



        <td class="td4"><span id="map_fbrq51160480">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：本科&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：三年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模少于50人

        </td>

        

        <td class="td5">

          <a id="jobappli_51160480" onclick="zzSearch.jobview( '51160480' );QuickApply(51160480,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160480">岗位职责： ⒈负责公司企业文化的提炼以及企业文化的宣导和传播； ⒉负责公司规章制度的管理，包括文件的立项、制订、审核、编号、颁发等，以及归档管理； ⒊维护公司各项规章制度的权威性、严肃性。对各项规章制度的执行情况实时跟踪，及...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160480' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160480',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid50745255" value="50745255" ></td>



        <td class="td1"><a href="http://search.51job.com/job/50745255,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >设计助理</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2728981,0000,10,1.html" class="coname" target="_blank" >文武之道科技（北京）有限公司</a></td>



        <td class="td3"><span id="map_jobarea50745255">北京-朝阳区</span></td>



        <td class="td4"><span id="map_fbrq50745255">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：一年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模50-150人

        </td>

        

        <td class="td5">

          <a id="jobappli_50745255" onclick="zzSearch.jobview( '50745255' );QuickApply(50745255,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo50745255">工作职责： 1、根据设计师的要求，负责描图、配色、调色等辅助设计工作； 2、收集主、辅料市场信息，受设计师指派采购合适的主、辅料； 3、设计图纸、资料收集、整理、归档、保管； 4、 负责“OK样板”的登记归档和保管； 5、负责图案绣花...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '50745255' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('50745255',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid50486384" value="50486384" ></td>



        <td class="td1"><a href="http://search.51job.com/job/50486384,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >市场推广专员</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2065403,0000,10,1.html" class="coname" target="_blank" >瑞思学科英语（北京）</a></td>



        <td class="td3"><span id="map_jobarea50486384">北京</span></td>



        <td class="td4"><span id="map_fbrq50486384">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：一年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：合资(欧美)&nbsp;&nbsp;|&nbsp;&nbsp;公司规模500人以上

        </td>

        

        <td class="td5">

          <a id="jobappli_50486384" onclick="zzSearch.jobview( '50486384' );QuickApply(50486384,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo50486384">职位描述： 1、创造性的进行公司商务合作拓展，配合市场完成招生销售任务。 2、主动挖掘市场需求，为公司的产品和服务寻找新的业务增长点。 3、按照公司的业务方向寻找更多的合作伙伴。 4、与市场配合，策划、联络、执行与儿童英语教育相...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '50486384' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('50486384',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid44823758" value="44823758" ></td>



        <td class="td1"><a href="http://search.51job.com/job/44823758,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >少儿英语教师—北京（English Teacher for Kids—Beijing）</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2065403,0000,10,1.html" class="coname" target="_blank" >瑞思学科英语（北京）</a></td>



        <td class="td3"><span id="map_jobarea44823758">北京</span></td>



        <td class="td4"><span id="map_fbrq44823758">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：本科&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：一年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：合资(欧美)&nbsp;&nbsp;|&nbsp;&nbsp;公司规模500人以上

        </td>

        

        <td class="td5">

          <a id="jobappli_44823758" onclick="zzSearch.jobview( '44823758' );QuickApply(44823758,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo44823758">    亲爱的朋友，当您浏览到这个网页的时候，我们相信您一定非常热爱“教师”这个职业！您也一定在很多教育机构中挑选一个心仪的公司。那么，您作为“瑞思学科英语”的教师，会有哪些不一样的收获呢？ 1.英语教育界的最高礼遇和尊崇，拥有...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '44823758' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('44823758',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid50531584" value="50531584" ></td>



        <td class="td1"><a href="http://search.51job.com/job/50531584,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >平面设计 实习生</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2742978,0000,10,1.html" class="coname" target="_blank" >北京汇新华盛广告有限公司</a></td>



        <td class="td3"><span id="map_jobarea50531584">北京-朝阳区</span></td>



        <td class="td4"><span id="map_fbrq50531584">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：无要求&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模少于50人

        </td>

        

        <td class="td5">

          <a id="jobappli_50531584" onclick="zzSearch.jobview( '50531584' );QuickApply(50531584,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo50531584">1负责各种宣传资料的设计与制作，如企业文化装饰展板、文化墙、会议背景、宣传册、广告、及其他设计需求； 2协助开展办公室其他工作 。 3学历要求：大专及以上学历者优先、绘画、平面设计等相关专业； 4具备扎实的艺术理论知识，熟练运用photoshop...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '50531584' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('50531584',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid51160475" value="51160475" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160475,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >采购部经理</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,120899,0000,10,1.html" class="coname" target="_blank" >哈尔滨誉衡药业股份有限公司北京分公司</a></td>



        <td class="td3"><span id="map_jobarea51160475">北京</span></td>



        <td class="td4"><span id="map_fbrq51160475">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：本科&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：五年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：合资(非欧美)&nbsp;&nbsp;|&nbsp;&nbsp;公司规模500人以上

        </td>

        

        <td class="td5">

          <a id="jobappli_51160475" onclick="zzSearch.jobview( '51160475' );QuickApply(51160475,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160475">岗位职责： 1、组织拟定本部门相关制度与业务流程，并监督执行； 2、组织制定本部门工作目标和工作计划，并负责落实； 3、制定集采工作计划、制度及流程，并负责落实； 4、负责管理采购的各项日常采购业务； 5、组织开展供应商的开发和管...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160475' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160475',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid49953238" value="49953238" ></td>



        <td class="td1"><a href="http://search.51job.com/job/49953238,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >平面设计师</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2742978,0000,10,1.html" class="coname" target="_blank" >北京汇新华盛广告有限公司</a></td>



        <td class="td3"><span id="map_jobarea49953238">北京-朝阳区</span></td>



        <td class="td4"><span id="map_fbrq49953238">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：一年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模少于50人

        </td>

        

        <td class="td5">

          <a id="jobappli_49953238" onclick="zzSearch.jobview( '49953238' );QuickApply(49953238,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo49953238">职位职能:  平面设计师  广告创意/设计主管/专员 职位描述: 职位描述: 负责设计项目的设计和执行 任职要求:  ◆ 扎实的美术功底及艺术修养,设计语言丰富并富创造力 ◆ 熟练使用各种设计软件（photoshop CS/Illustrator CS/Indesign CS），...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '49953238' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('49953238',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid47093123" value="47093123" ></td>



        <td class="td1"><a href="http://search.51job.com/job/47093123,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >中心校长</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2065403,0000,10,1.html" class="coname" target="_blank" >瑞思学科英语（北京）</a></td>



        <td class="td3"><span id="map_jobarea47093123">北京</span></td>



        <td class="td4"><span id="map_fbrq47093123">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：本科&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：三年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：合资(欧美)&nbsp;&nbsp;|&nbsp;&nbsp;公司规模500人以上

        </td>

        

        <td class="td5">

          <a id="jobappli_47093123" onclick="zzSearch.jobview( '47093123' );QuickApply(47093123,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo47093123">中心校长： 岗位职责： 1.负责中心开业启动和长期健康运营； 2.负责对培训中心的经营指导，并进行有效的业务技能培训及团队梯队培养； 3.对所辖区域中心进行运营监控； 4.完成所在中心的经营任务，对经营结果负责。   任职要求： 1.本科及...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '47093123' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('47093123',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid51160472" value="51160472" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51160472,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >行政专员/助理</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2411752,0000,10,1.html" class="coname" target="_blank" >北京史三八医疗美容医院</a></td>



        <td class="td3"><span id="map_jobarea51160472">北京</span></td>



        <td class="td4"><span id="map_fbrq51160472">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：三年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模50-150人

        </td>

        

        <td class="td5">

          <a id="jobappli_51160472" onclick="zzSearch.jobview( '51160472' );QuickApply(51160472,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51160472">岗位职责  1、日常行政管理的运作； 2、负责档案管理及各类文件、资料的鉴定及统计管理工作； 3、负责各类会务的安排，对各项行政事务的安排及执行；4、负责考勤统计、与社会保险公司的对接工作； 5、解决日常的薪酬福利问题，并提供支持...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51160472' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51160472',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid50696854" value="50696854" ></td>



        <td class="td1"><a href="http://search.51job.com/job/50696854,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >出纳员</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2437360,0000,10,1.html" class="coname" target="_blank" >北京雅伦传媒文化发展有限公司</a></td>



        <td class="td3"><span id="map_jobarea50696854">北京-朝阳区</span></td>



        <td class="td4"><span id="map_fbrq50696854">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：中专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：三年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司规模少于50人

        </td>

        

        <td class="td5">

          <a id="jobappli_50696854" onclick="zzSearch.jobview( '50696854' );QuickApply(50696854,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo50696854">岗位职责 1、普通工作人员职位，协助上级执行一般的不需较多工作经验的任务； 2、负责公司现金、票据及银行存款的保管、出纳和记录； 3、配合各部门办理电汇、信汇等有关手续； 4、协助会计做好各种帐务的处理工作； 5、负责掌管小额现金...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '50696854' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('50696854',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid49997944" value="49997944" ></td>



        <td class="td1"><a href="http://search.51job.com/job/49997944,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >司机 小客车 B本 京籍</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,2437360,0000,10,1.html" class="coname" target="_blank" >北京雅伦传媒文化发展有限公司</a></td>



        <td class="td3"><span id="map_jobarea49997944">北京-朝阳区</span></td>



        <td class="td4"><span id="map_fbrq49997944">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：高中&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：三年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司规模少于50人

        </td>

        

        <td class="td5">

          <a id="jobappli_49997944" onclick="zzSearch.jobview( '49997944' );QuickApply(49997944,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo49997944">任职要求：  1、北京市户口，居住地在三元桥或东大桥周边10公里半径内优先考虑；   熟悉北京市及周边道路,驾龄2年以上。B本以上；  2、年龄25-45岁，高中以上学历；  3、头脑灵活 、无犯罪记录，无不良嗜好，无家庭负担；  4、有较强的组...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '49997944' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('49997944',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#ffffff">



        <td class="td0"><input type="checkbox" name="selectJobid51027012" value="51027012" ></td>



        <td class="td1"><a href="http://search.51job.com/job/51027012,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >人事助理</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#ffffff' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,108836,0000,10,1.html" class="coname" target="_blank" >北京鸿日东方数码科技有限公司</a></td>



        <td class="td3"><span id="map_jobarea51027012">北京-海淀区</span></td>



        <td class="td4"><span id="map_fbrq51027012">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：无要求&nbsp;&nbsp;|&nbsp;&nbsp;公司规模150-500人

        </td>

        

        <td class="td5">

          <a id="jobappli_51027012" onclick="zzSearch.jobview( '51027012' );QuickApply(51027012,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#ffffff">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo51027012">要求：1，大专或以上学历。形象好，气质佳。2，有人事相关经验，如：招聘，面试，培训等人事方面。3，熟练使用办公软件。excel 、word、access等。4，具有服务意识，大量招聘渠道。联系人：张经理 18600577485 13811598195</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '51027012' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('51027012',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr>

      <tr class="tr0" bgcolor="#f6f6f6">



        <td class="td0"><input type="checkbox" name="selectJobid45164092" value="45164092" ></td>



        <td class="td1"><a href="http://search.51job.com/job/45164092,c.html" onclick="zzSearch.acStatRecJob( 1 );" class="jobname" target="_blank" >市场经理</a><img src="http://img01.51jobcdn.com/im/2009/search/db_arrow_down.gif" align="absmiddle" onclick="zzSearch.switchListType( this , '#f6f6f6' );"></td>



        <td class="td2"><a href="http://search.51job.com/list/co,c,233929,0000,10,1.html" class="coname" target="_blank" >深圳市华富洋供应链有限公司</a></td>



        <td class="td3"><span id="map_jobarea45164092">北京</span></td>



        <td class="td4"><span id="map_fbrq45164092">2012-06-11</span></td>



        <td class="td5">&nbsp;</td>



      </tr>

      <tr class="tr1" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234">

          学历要求：大专&nbsp;&nbsp;|&nbsp;&nbsp;

          工作经验：一年以上&nbsp;&nbsp;|&nbsp;&nbsp;公司性质：民营公司&nbsp;&nbsp;|&nbsp;&nbsp;公司规模150-500人

        </td>

        

        <td class="td5">

          <a id="jobappli_45164092" onclick="zzSearch.jobview( '45164092' );QuickApply(45164092,'c','http://my.51job.com',this);return false;" target="_blank" style="cursor:pointer"><img src="http://img01.51jobcdn.com/im/2009/search/c/ljsq1.gif" border="0" align="absmiddle"></a>

        </td>

      </tr>

      <tr class="tr2" style="display: none;" bgcolor="#f6f6f6">

        <td class="td0">&nbsp;</td>

        <td colspan="4" class="td1234 wordBreakNormal">

          职位简介:<span id="jobinfo45164092">一、职位要求： 1、专业不限，学历不限，形象气质佳； 2、熟悉北京电子市场，具有两年以上电子产品销售经验或一年以上独立带销售团队经验； 3、有很强的学习能力和承压能力，进入公司后可以迅速熟悉行业情况、操作流程； 4、有供应链行业...</span>

        </td>

        <td class="td5">

          <font style="float:left;width:0px;overflow:hidden">&nbsp;</font>

          <p style="margin-left:8px;">

          <span onclick="zzSearch.saveJobClk( '45164092' , event );" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/sctb.gif" border="0" align="absmiddle">&nbsp;收藏

          </span>

          <br />

          <span onclick="GetCompetition('45164092',0,'http://my.51job.com',1,1 );return false;" style="color:#FF7300;">

            <img src="http://img01.51jobcdn.com/im/2009/search/tdfx.gif" border="0" align="absmiddle">&nbsp;投递分析

          </span>

          </p>

        </td>

      </tr>

    <tr class="tr3"><td colspan="6"></td></tr></table></div>

      <div class="bt_center clearboth">

        <table cellpadding="0" cellspacing="0" class="resultNav">

          <tr>

            <td>

              <span onclick="zzSearch.selectAllJobs( this.firstChild.checked = !this.firstChild.checked ,'quanxuan_bottom');" style="cursor: pointer;"><input type="checkbox" id="quanxuan_bottom" value="" onclick="this.checked=!this.checked;(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=30&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();" />全选</span>

              

      <span>

        |&nbsp;<a href="javascript:void(0);" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=31&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();zzSearch.showSelectedJobs();return false;" class="orange1">显示选中职位</a>

        |&nbsp;<a href="javascript:void(0);" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=32&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();QuickApply(1,'c','http://my.51job.com',this);return false;" class="orange1">申请选中职位</a>

        |&nbsp;<a href="javascript:void(0);" onclick="(new Image()).src='http://search.51job.com/jobsearch/click_record.php?guid=cr&fromType=33&stype=2&phpReferer=&phpSelf=search_result.php&ran='+Math.random();zzSearch.putInMyJobFolder( event );return false;" class="orange1">放入职位收藏夹</a>

      </span>

    

            </td><td class="nav_r"><table  class="searchPageNav" cellpadding="0" cellspacing="0" ><tr><td  style="padding-right:5px;" ><img src="http://img01.51jobcdn.com/im/2009/pageloff.gif" border="0" /></td><td  class="currPage" >1</td><td><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,2.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9"  class="orange1"  onclick="zzSearch.jumpPage( this.href );return false;" >2</a></td><td><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,3.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9"  class="orange1"  onclick="zzSearch.jumpPage( this.href );return false;" >3</a></td><td><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,4.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9"  class="orange1"  onclick="zzSearch.jumpPage( this.href );return false;" >4</a></td><td><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,5.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9"  class="orange1"  onclick="zzSearch.jumpPage( this.href );return false;" >5</a></td><td><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,6.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9"  class="orange1"  onclick="zzSearch.jumpPage( this.href );return false;" >6</a></td><td><a href="http://search.51job.com/list/0100,0000,0000,00,3,99,%2B,2,2.html?lang=c&stype=2&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=01&lonlat=0%2C0&radius=-1&ord_field=0&list_type=0&confirmdate=9"  class="orange1"  onclick="zzSearch.jumpPage( this.href );return false;"  style="border:0px; width:auto;margin-left:5px;" ><img src="http://img01.51jobcdn.com/im/2009/pageron.gif" border="0" /></a></td></tr></table></td>

              <td class="nav_r" width="80px;">

                <a href="#top"><img src="http://img01.51jobcdn.com/im/2009/search/top.gif" align="absmiddle" /></a>

              </td>

          </tr>

        </table>

      </div>

    <div class='search_right_top'><style type="text/css">

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

   <ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0100">北京招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0200">上海招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0302">广州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0400">深圳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2804">包头招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1602">石家庄招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0500">天津招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2102">太原招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2802">呼和浩特招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1604">保定招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1603">廊坊招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1606">秦皇岛招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1605">唐山招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2402">长春招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2303">大连招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2302">沈阳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2202">哈尔滨招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2403">吉林招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0702">南京招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1302">南昌招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0803">宁波招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0709">南通招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0705">常州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1203">青岛招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">泉州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0703">苏州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0805">绍兴招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1102">福州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0808">台州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0704">无锡招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0804">温州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0802">杭州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1502">合肥招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">厦门招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0711">徐州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1202">济南招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0807">嘉兴招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0806">金华招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1204">烟台招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0708">扬州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0706">昆山招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">漳州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0710">镇江招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1208">临沂招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1503">芜湖招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1205">潍坊招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1206">威海招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0715">江阴招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0707">常熟招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0714">张家港招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0713">盐城招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0712">连云港招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0719">淮安招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0718">泰州招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0809">湖州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0814">义乌招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1207">淄博招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1209">济宁招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1402">南宁招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1902">长沙招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0308">东莞招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1003">三亚招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1802">武汉招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1702">郑州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0307">中山招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0305">珠海招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1002">海口招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0306">佛山招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0303">惠州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0315">江门招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0304">汕头招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1703">洛阳招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1803">宜昌招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1805">襄阳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1807">荆州招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1903">株洲招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1905">衡阳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1904">湘潭招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1907">常德招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0317">湛江招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0319">清远招聘</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0325">顺德招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0902">成都招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0600">重庆招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2602">贵阳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2502">昆明招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0903">绵阳招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=3102">乌鲁木齐招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2002">西安招聘</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2702">兰州招聘</a></li></ul></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0100">北京人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0200">上海人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0302">广州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0400">深圳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2804">包头人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1602">石家庄人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0500">天津人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2102">太原人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2802">呼和浩特人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1604">保定人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1603">廊坊人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1606">秦皇岛人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1605">唐山人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2402">长春人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2303">大连人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2302">沈阳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2202">哈尔滨人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2403">吉林人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0702">南京人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1302">南昌人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0803">宁波人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0709">南通人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0705">常州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1203">青岛人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">泉州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0703">苏州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0805">绍兴人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1102">福州人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0808">台州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0704">无锡人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0804">温州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0802">杭州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1502">合肥人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">厦门人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0711">徐州人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1202">济南人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0807">嘉兴人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0806">金华人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1204">烟台人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0708">扬州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0706">昆山人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-mn.php">漳州人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0710">镇江人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1208">临沂人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1503">芜湖人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1205">潍坊人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1206">威海人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0715">江阴人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0707">常熟人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0714">张家港人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0713">盐城人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0712">连云港人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0719">淮安人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0718">泰州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0809">湖州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0814">义乌人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1207">淄博人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1209">济宁人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1402">南宁人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1902">长沙人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0308">东莞人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1003">三亚人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1802">武汉人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1702">郑州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0307">中山人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0305">珠海人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1002">海口人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0306">佛山人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0303">惠州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0315">江门人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0304">汕头人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1703">洛阳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1803">宜昌人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1805">襄阳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1807">荆州人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1903">株洲人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1905">衡阳人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1904">湘潭人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=1907">常德人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0317">湛江人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0319">清远人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0325">顺德人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0902">成都人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0600">重庆人才网</a></li></ul><ul><li style="font-weight: bold; font-size: 14px; color: rgb(102, 102, 102);">地区人才网招聘</li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2602">贵阳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2502">昆明人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=0903">绵阳人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=3102">乌鲁木齐人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2002">西安人才网</a></li><li class="st_one"><a target="_blank" href="http://www.51job.com/default-area.php?area=2702">兰州人才网</a></li></ul>  </div>

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

</script></div><div class="search_right_top"><div class="graybttop"><span><img src="http://img01.51jobcdn.com/im/2009/graybttl.gif" align="left"/></span><span><img src="http://img01.51jobcdn.com/im/2009/graybttr.gif" align="right"/></span><div class="btname" style="padding-top:5px;"><a href="http://www.51job.com/careerpost/jianlishuoming/index.php" style="color:#FF6600;" target="_blank"><strong style="font-size:14px;">个人简历模板-简历指导</strong></a></div></div><div class="grayline"><p class="graybttopbg"></p><div style="padding:5px"><style type="text/css">

  .resumeGuide{

    clear:both;

    line-height:20px;

    height:40px;

    background-color:#FFFFFF;

    padding:10px 20px;

  }

  .resumeGuide li{

    float:left;

    width:230px;

    margin-left:5px;

    list-style-type:none;

    white-space: nowrap;

  }

  #resumeGuideTopicsBody{

    height:52px;

    width:auto;

    overflow-y:hidden;

  }

</style>

<div id="resumeGuideTopicsBody" style="height:62px;width:auto;overflow-y:hidden;">

</div>

<div id="resumeGuideTopics" style="display:none">

  <div><ul class="resumeGuide"><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/9.php" title="简历样本"><strong>简历样本</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/resume_template_class_3_25.html" title="计算机软件个人简历范文">计算机软件个人简...</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/9.php" title="简历范文"><strong>简历范文</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/resume_template_class_3_23.html" title="护士专业个人简历样本">护士专业个人简历...</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/recommendation_list_1.html" title="推荐信"><strong>推荐信</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/article_class_04_11.html" title="经典的班主任推荐信">经典的班主任推荐信</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/cover_letter_list_1.html" title="自荐书"><strong>自荐书</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/article_class_02_21.html" title="应届硕士毕业生自荐信">应届硕士毕业生自荐信</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/cover_letter_list_1.html" title="自荐信"><strong>自荐信</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/article_class_02_17.html" title="求职自我推荐信">求职自我推荐信</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/self_appraisal_list_1.html" title="自我评价"><strong>自我评价</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/article_class_03_15.html" title="找工作自我评价">找工作自我评价</a></li></ul></div><div><ul class="resumeGuide"><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/self_appraisal_list_1.html" title="自我鉴定"><strong>自我鉴定</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/article_class_03_14.html" title="计算机毕业大学生自我鉴定">计算机毕业大学生...</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/application_letter_list_1.html" title="求职信"><strong>求职信</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/article_class_01_20.html" title="电子专业求职信">电子专业求职信</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/table_resume_1.html" title="个人简历表格"><strong>个人简历表格</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/image_class_3_14.html" title="个人简历表格一">个人简历表格一</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/badge_list_1.html" title="高校校徽下载"><strong>高校校徽下载</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/image_class_2_436.html" title="衢州职业技术学院">衢州职业技术...</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/cover_resumelist_1.html" title="简历封面下载"><strong>简历封面下载</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/image_class_1_13.html" title="[简历封面下载]进取">[简历封面下...</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/university_resumelist_1.html" title="高校简历模板"><strong>高校简历模板</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/resume_template_class_2_39.html" title="苏州大学简历模板">苏州大学简历...</a></li></ul></div><div><ul class="resumeGuide"><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/professional_resumelist_1_0.html" title="专业简历模板"><strong>专业简历模板</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/resume_template_class_1_280.html" title="生物科学类">生物科学类</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/9.php" title="简历样本"><strong>简历样本</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/resume_template_class_3_13.html" title="广告设计类简历样本">广告设计类简历样本</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/9.php" title="简历范文"><strong>简历范文</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/resume_template_class_3_22.html" title="法律个人简历范文">法律个人简历范文</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/application_letter_list_1.html" title="求职信"><strong>求职信</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/article_class_01_18.html" title="会计求职信">会计求职信</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/cover_letter_list_1.html" title="自荐信"><strong>自荐信</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/article_class_02_20.html" title="应届毕业生自荐信">应届毕业生自荐信</a></li><li><a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/self_appraisal_list_1.html" title="自我评价"><strong>自我评价</strong></a>&nbsp|&nbsp<a target="_blank" href="http://www.51job.com/careerpost/jianlishuoming/article_class_03_11.html" title="毕业生自我评价">毕业生自我评价</a></li></ul></div></div>

<script src="http://js.51jobcdn.com/in/js/2009/NewScrollText.js" language="javascript"></script>

<script>

  if(document.getElementById("resumeGuideTopics") && document.getElementById("resumeGuideTopicsBody")){

    var newScrolltext = new NewScrollText("resumeGuideTopics","resumeGuideTopicsBody",25,10,2);

    newScrolltext.initMarquee();

  };

</script></div></div><div class="graybott"><span><img src="http://img01.51jobcdn.com/im/2009/graybl.gif" align="left"/></span><span><img src="http://img01.51jobcdn.com/im/2009/graybr.gif" align="right"/></span></div></div></div><div class="clearboth"></div></div>

    <form name="pageForm" action="" method="post" style="display:none">



      <input type="hidden" name="postchannel"   value="0000">



      <input type="hidden" name="stype"     value="2">



      <input type="hidden" name="jobarea"     value="0100">

      <input type="hidden" name="district"    value="0000">

      <input type="hidden" name="address"     value="">

      <input type="hidden" name="lonlat"      value="0,0">

      <input type="hidden" name="radius"      value="-1">



      <input type="hidden" name="funtype"     value="0000">

      <input type="hidden" name="industrytype"  value="00">

      <input type="hidden" name="issuedate"   value="3">

      <input type="hidden" name="keywordtype"   value="2">

      <input type="hidden" name="keyword"     value="">



      <input type="hidden" name="workyear"    value="99">

      <input type="hidden" name="providesalary" value="99">

      <input type="hidden" name="cotype"      value="99">

      <input type="hidden" name="degreefrom"    value="99">

      <input type="hidden" name="jobterm"     value="01">



      <input type="hidden" name="ord_field"   value="0">

      <input type="hidden" name="list_type"   value="0">



      <input type="hidden" name="curr_page"   value="1">

      <input type="hidden" name="nStart"      value="1">

      <input type="hidden" name="ppc_num"     value="0">

      <input type="hidden" name="jobid_list"    value="51160594~51160584~51160329~51160571~51160508~51066648~50862254~50727820~43565087~51160066~51160514~51160536~51160525~51160197~50210904~49751429~51160484~51160480~50745255~50486384~44823758~50531584~51160475~49953238~47093123~51160472~50696854~49997944~51027012~45164092~51160466~45164174~51160465~49428900~51159552~51160456~51160447~50332782~50322682~51160426~51160399~44639911~51160424~51160409~51160406~47989209~51160179~51160392~46724967~51160369~51160357~51160352~47663256~45381711~47663677~47663528~50554920~49462557~49480656~48865435~47316954~51081145~51160269~51160301~51160299~51160275~47420660~51160295~51160287~51160282~51160265~51160494~47790195~51160251~51160509~50653202~50653122~51160474~51014218~51160356~51160235~51160234~51160228~51160224~51160221~47565021~51160217~50694851~51160436~51160210~50040060~50039960~51160200~50040133~50040218~51160437~50039701~51069250~51144604~50826888~49881098~51160173~50988950~51160167~51160166~50297373~49880095~45337187~45337127~51160147~51160144~50815287~51160130~50760136~40109053~51160125~51160362~51160345~51160105~42478558~41828191~41502839~39678224~38218250~45631331~50837601~51160076~50843901~50797302~50796759~46611115~46063783~46062172~50801391~50837506~51004637~50813690~50765518~50582068~50434097~50433659~47588906~51160319~51160312~51160048~42748779~51160037~47701115~51160283~51160043~51160270~51160038~50914694~46796938~51160019~51160266~45602397~51160023~44848316~51160261~51160260~48578644~51160011~51160253~50945344~50138735~51127113~51004986~50893156~50892959~51160009~51160002~49966786~51159999~50994656~49638152~43567597~51160232~50526382~49342187~">

      <input type="hidden" name="jobid_count"   value="100000">

      <input type="hidden" name="schTime"     value="31">

      <input type="hidden" name="statData"    value="100000|0|0|0|0|0|0|0|8942|5170|3304|5583|4013|58298|268|13526|5|644|247|18|614|3457|701|3890|37053|38181|1640|82|380|13984|639|3301|24178|19304|18350|8438|1178|724|23888|82497|69|480|3617|4732|3712|1998|1222|1174|269|105|41|84|99205|795|0|0|0|0">



      <input type="hidden" name="selectedJobids"  value="">

      

      <input type="hidden" name="confirmdate" value="9">



      <input type="hidden" name="fromType"    value="">



    </form>


    <form name="pageJumpForm" method="post" action="" target="_blank" style="display: none;">

      <input type="hidden" name="jobiduni" value="">

    </form></div><!--bottom start-->

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

    fileName: 'search_result.php' ,

    lang : 'c' ,

    stype : '2' ,

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

      zzSearch.initJobareaLayer();

      zzSearch.initSearchInResult();

      zzSearch.showTips();

      initConfirmDateBindEvt();

      initKeyWrodsBindEvt('请输入关键字');

      zzSearch.initFuntypeLayer();

      zzSearch.initIndtypeLayer();

      zzSearch.initListTrOverOut();

      zzSearch.initExcludeSearch();

      zzSearch.searchForm.onsubmit = function() { zzSearch.formSub( this ); return false; };

      zzSearch.initKwdTypeSel();

      zzSearch.initKwdInputEvt();

      zzSearch.initAutoCom();

    }

  }

  var intVal = window.setInterval( searchInit , 50 );

//-->

</script>
HTML_str

def parse_html(html)  
  doc = Nokogiri::HTML(html)
  url_list = []
  doc.css('td.td2 a.coname').each do |item|
    company_name = '' + item.text
    company_url = item['href']
    t = {}      
    t[:name] = company_name
    t[:url] = company_url
    url_list.push(t)
  end  
  url_list
end

#puts html
puts parse_html(html)
