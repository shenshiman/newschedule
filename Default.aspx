<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <title>boss行程录入</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
    <link rel="stylesheet" href="css/jquery.mobile-1.4.3.css"/>
    <script src="https://g.alicdn.com/ilw/ding/0.6.6/scripts/dingtalk.js" type="text/javascript"></script>
    <script src="js/mobiscroll.custom-2.5.0.min.js" type="text/javascript"></script>
    <link href="css/mobiscroll.custom-2.5.0.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.ui.datepicker-zh-CN.js" type="text/javascript"></script>
    <style>
        table{
            width:90%;
            
            margin:0 auto;
        }
        table tr{
          height:2rem;
        }
       
        input[type='radio']{
            width:0.8rem;

        }
        .ui-input-text
        {
            border:none;
            
            }
        .ui-btn{
          margin-top:8rem;
        }
        .ui-fixed-hidden
        {
            bottom:-50px !important;}
            label
            {
                color:#3388cc;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<div data-role="page" id="index">


  <form method="post" action="" id="commentForm">
  <input type="text" id="Riqi" style="display:none;" runat="server" />
  <input type="text" id="Yuefen" style="display:none;" runat="server" />
  <input type="text" id="corpid" style="display:none;" runat="server"/>
    <div data-role="fieldcontain">
      <table>
        <tr>
        
          <td>
            <label for="fullname">开始日期</label>
          </td>
          <td>
            
            <input type="text" name="fullname" class="date" id="Date1" runat="server" placeholder='必填'/>
          </td>
        </tr>
        <tr>
          <td>
            <label for="fullname">结束日期</label>
          </td>
          <td>
            <input type="text" name="fullname"  class="date" id="Date2" runat="server" placeholder='必填'/>
          </td>
        </tr>
        <tr>
          <td>
            <label for="fullname">录入人</label>
          </td>
          <td>
            <input type="text" id="Persons" runat="server" name="fullname" disabled="disabled" />
          </td>
        </tr>
          <tr>
          <td>
            <label for="fullname">地点</label>
          </td>
          <td>
            <input type="text" id="Address" runat="server" name="fullname"  placeholder='必填'/>
          </td>
        </tr>
        <tr>
          <td>
            <label for="fullname">主题</label>
          </td>
          <td>
            <input type="text" name="fullname" id="Theme" runat="server"  placeholder='必填'/>
          </td>
        </tr>
        <tr>
          <td>
            <label for="fullname">主办方</label>
          </td>
          <td>
            <input type="text"  id="Sponsor" runat="server" />
          </td>
        </tr>
        <tr>
          <td>
            <label for="fullname">规模</label>
          </td>
          <td>
            <input type="number" name="fullname" id="Scale"  onkeyup="value=value.replace(/[^\d]/g,'')" onblur="value=value.replace(/[^\d]/g,'')" /> 

          </td>
        </tr>
        <tr>
          <td>
            <label for="fullname">备注</label>
          </td>
          <td>
            <input type="text" name="fullname" id="Remark" runat="server">
          </td>
        </tr>
       
       

      </table>
      <%--<input type="button" value="确定" onclick="" />--%>
      <div data-role="footer" data-position="fixed">
        <div data-role="navbar">
            <ul>
                <li><a href="#" id="btn" data-icon="plus" class="ui-btn-active">保存</a></li>
               
                <li><a href="#" id="chakan" data-icon="back"  data-ajax="false" >退出</a></li>
            </ul>
        </div>
    </div>
    </div>
</form>
</div>

    <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.mobile-1.4.3.js"></script>
    
    <script src="js/mobiscroll.custom-2.5.0.min.js" type="text/javascript"></script>
    </form>
</body>
</html>
<script>

    $(function () {


        var namess = $("#corpid").val();
        //alert(namess);
        $("#chakan").click(function () {
            //alert(namess);
            location.href = 'http://www.phnixit.com/newschedule/index.html?corpid=' + namess;
        });
        var IDS = $("#IDS").val();
        
        //$("#chakan").trigger("click");
        var hh = document.documentElement.cilentHeight;
        document.body.style.height = hh + "px";
        //alert("hh");
        var date = new Date;
        var year = date.getFullYear();
        //alert(year);
        var riqi = $("#Riqi").val();
        var yuefen = $("#Yuefen").val();
        riqi <= 9 ? riqi = "0" + riqi : riqi = riqi;
        yuefen <= 9 ? yuefen = "0" + yuefen : yuefen = yuefen;
        //alert(riqi)
        var datete = year + "-" + yuefen + "-" + riqi + " " + "08:00";
        //alert(datete);
        $("#Date1").val(datete);
        $("#Date2").val(datete);
        $('#btn').click(function () {
            //alert($("#Date1").val());
            if ($("#Date1").val() == "") {
                alert("请输入开始时间");
            } else if ($("#Date2").val() == "") {
                alert("请输入结束时间")

            } else if ($("#Address").val() == "") {
                //Save();
                alert("请输入地点");
            }
            else if ($("#Theme").val() == "") {
                //Save();
                alert("请输入本次行程主题");
            }
            else {
                //alert("aa");
                Save();
            }
        })

        //        $("#Date2").focus(function () {
        //            alert("a");
        //        });

    })


    var requestDate = $("#Riqi").val();

    if (requestDate != "") {
        requestDate = new Date(requestDate);
        $("#Riqi").scroller('setDate', requestDate, true);
    } 
    

    var currYear = (new Date()).getFullYear();

    //初始化日期控件
    var opt = {
        preset: 'datetime', //日期，可选：date\datetime\time\tree_list\image_text\select
        theme: 'default', //皮肤样式，可选：default\android\android-ics light\android-ics\ios\jqm\sense-ui\wp light\wp
        display: 'modal', //显示方式 ，可选：modal\inline\bubble\top\bottom
        mode: 'scroller', //日期选择模式，可选：scroller\clickpick\mixed
        lang: 'zh',
        dateFormat: 'yyyy-mm-dd', // 日期格式
        setText: '确定', //确认按钮名称
        cancelText: '取消', //取消按钮名籍我
        dateOrder: 'yyyymmdd', //面板中日期排列格式
        dayText: '日', monthText: '月', yearText: '年', hourText: '时', minuteText: '分', //面板中年月日文字
        showNow: false,
        nowText: "今",
        startYear: currYear, //开始年份  
        timeWheels: 'HHii',
        timeFormat: 'HH:ii',
        endYear: currYear + 100 //结束年份  
        //endYear:2099 //结束年份
    };

    $(".date").mobiscroll(opt);
    

</script>
<script type="text/javascript">
  
    function GetQueryString(name) {

        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");

        var r = window.location.search.substr(1).match(reg);

        if (r != null) return unescape(r[2]); return null;

    }
    function Save() {
        var date1 = $("#Date1").val();
        var date2 = $("#Date2").val();
        var persons = $("#Persons").val();
        var add = $("#Address").val();
        var theme = $("#Theme").val();
        var sponsor = $("#Sponsor").val();
        var scale = $("#Scale").val();
        var remark = $("#Remark").val();

        if (date1 > date2) {
            alert("开始时间不能晚于结束时间");
        } else {
            if (persons == "宗毅" || persons == "张艳" || persons == "魏文华" || persons == "吴柳荷") {
            $.ajax({
                type: "Post",
                url: "Hanlder.aspx/SaveMsg",
                data: "{'date1':'" + date1 + "','date2':'" + date2 + "','persons':'" + persons + "','add':'" + add + "','theme':'" + theme + "','sponsor':'" + sponsor + "','scale':'" + scale + "','remark':'" + remark + "'}",
                contentType: "application/json; charset=utf-8",
                async: true,
                dataType: "json",
                success: function (data) {
                    alert(data.d);
                    $("#chakan").trigger("click");



                },
                error: function (err) {
                    //alert("查询出现错误！");
                }
            });
        } else {
        alert("你没有录入权限！");
        }
}
    }
</script>
