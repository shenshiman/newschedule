<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <title>boss行程查看</title>
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
        input[type='text']
        {
           text-align:left; }
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
    <div data-role="fieldcontain">
      <table>
        <tr>
        <input type="text" id="IDS" style="display:none;" runat="server"/>
        <input type="text" id="myName" style="display:none;" runat="server"/>
        <input type="text" id="corpid" style="display:none;" runat="server"/>
          <td>
            <label for="fullname">开始日期</label>
          </td>
          <td>
            <input type="text" name="fullname" class="date" id="Date1" runat="server" placeholder='必填' />
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
            <input type="text" id="Persons" runat="server" name="fullname" readonly="readonly" style="color:#aeaeae;"/>
          </td>
        </tr>
          <tr>
          <td>
            <label for="fullname">地点</label>
          </td>
          <td>
            <input type="text" id="Address" runat="server" name="fullname"  placeholder='必填' style=""/>
          </td>
        </tr>
        <tr>
          <td>
            <label for="fullname">主题</label>
          </td>
          <td>
            <input type="text" name="fullname" id="Theme" runat="server"  placeholder='必填' style=""/>
          </td>
        </tr>
        <tr>
          <td>
            <label for="fullname">主办方</label>
          </td>
          <td>
            <input type="text"  id="Sponsor" runat="server" style=""/>
          </td>
        </tr>
        <tr>
          <td>
            <label for="fullname">规模</label>
          </td>
          <td>
            <input style="" type="number"  name="fullname" id="Scale"  onkeyup="value=value.replace(/[^\d]/g,'')" onblur="value=value.replace(/[^\d]/g,'')" /> 
          </td>
        </tr>
        <tr>
          <td>
            <label for="fullname">备注</label>
          </td>
          <td>
            <input type="text" name="fullname" id="Remark" runat="server" style="" >
          </td>
        </tr>
       
       

      </table>
      <%--<input type="button" value="确定" onclick="" />--%>
      <div data-role="footer" data-position="fixed" id="foots">
        <div data-role="navbar">
            <ul>
                <li><a href="#" id="btn" data-icon="plus" class="ui-btn-active">确认修改</a></li>
               
                <li><a href=""  id="tuichu" data-icon="back"   onclick='' >退出</a></li>
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



        //        function tuichu() {
        //            window.location.href = document.referrer
        //        }
        var namess = $("#corpid").val();
        //alert(namess);
        $("#tuichu").click(function () {
            //alert(namess);
            location.href = 'http://www.phnixit.com/newschedule/index.html?corpid=' + namess;
        });
        var IDS = $("#IDS").val();
        //alert(IDS)
        $.ajax({
            type: "Post",
            url: "Hanlder.aspx/ShowDetailDD",
            data: "{'ID':'" + IDS + "'}",
            contentType: "application/json; charset=utf-8",
            async: false,
            dataType: "json",
            success: function (data) {

                $(data.d).each(function () {
                    //alert(this.time)
                    $("#Date1").val(this.time);
                    $("#Date2").val(this.time2);
                    $("#Persons").val((this.users).replace(/(^\s*)|(\s*$)/g, ""));
                    $("#Address").val((this.address).replace(/(^\s*)|(\s*$)/g, ""));
                    $("#Theme").val((this.theme).replace(/(^\s*)|(\s*$)/g, ""));
                    $("#Sponsor").val((this.sponsor).replace(/(^\s*)|(\s*$)/g, ""));
                    $("#Scale").val((this.scale).replace(/(^\s*)|(\s*$)/g, ""));
                    $("#Remark").val((this.remark).replace(/(^\s*)|(\s*$)/g, ""));

                })
                var namess = $("#myName").val();
                var personss = $("#Persons").val();
                if (namess == personss || namess == "宗毅") {
                } else {
                    $("#Date1").attr("disabled", "disabled");
                    $("#Date2").attr("disabled", "disabled");
                    // $("#Persons").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#Address").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#Theme").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#Sponsor").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#Remark").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#Scale").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#foots").css("display", "none");
                }
                var date = new Date();
                var yy = date.getFullYear();
                var mm = date.getMonth() + 1;
                var dd = date.getDate();
                mm <= 9 ? mm = "0" + mm : mm = mm;
                dd <= 9 ? dd = "0" + dd : dd = dd;
                var nowsday = yy + "-" + mm + "-" + dd + " " + "08:00";
                var datess = $("#Date1").val();
                //alert(nowsday);
                //alert(datess);

                if (nowsday>datess) {
                    $("#Date1").attr("disabled", "disabled");
                    $("#Date2").attr("disabled", "disabled");
                    // $("#Persons").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#Address").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#Theme").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#Sponsor").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#Remark").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#Scale").css("color", "#aeaeae").attr("readonly", "readonly");
                    $("#foots").css("display", "none");
                } else { 

                }
                //alert($("#Date1").val())
                //alert("nihao");
                //                if (data.d) {
                //                    alert(data.d);
                //                } else {
                //                    //alert("")
                //                }

                //window.history.go(-1);
                //parent.location.reload()
                //self.location = document.referrer

            },
            error: function (err) {
                alert("查询出现错误！");
            }

        });

        var hh = document.documentElement.cilentHeight;
        document.body.style.height = hh + "px";
        //alert($("#myName").val());
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
                var IDS = $("#IDS").val();
                var time = $("#Date1").val();
                var time2 = $("#Date2").val();
                var persons = $("#Persons").val();
                var address = $.trim($("#Address").val());
                var theme = $("#Theme").val();
                var sponsor = $("#Sponsor").val();
                var scale = $("#Scale").val();
                var remark = $("#Remark").val();
                var namess = $("#myName").val();

                if (time - 1 > time2) {
                    alert("开始时间不能晚于结束时间")
                } else {

                    if (namess == "张艳" || namess == "沈仕满" || namess == "魏文华" || namess == "宗毅" || namess == "吴柳荷" || namess == "王刚") {
                        if (namess == persons || namess == "宗毅"||namess=="张艳") {

                            $.ajax({
                                type: "Post",
                                url: "Hanlder.aspx/updateSchedule",
                                data: "{'ID':'" + IDS + "','time':'" + time + "','time2':'" + time2 + "','persons':'" + persons + "','address':'" + address + "','theme':'" + theme + "','sponsor':'" + sponsor + "','scale':'" + scale + "','remark':'" + remark + "'}",
                                contentType: "application/json; charset=utf-8",
                                async: false,
                                dataType: "json",
                                success: function (data) {
                                    //alert("nihao");
                                    if (data.d) {
                                        alert(data.d);
                                    } else {
                                        //alert("")
                                    }

                                    //window.history.go(-1);
                                    //parent.location.reload()
                                    //self.location = document.referrer

                                },
                                error: function (err) {
                                    alert("查询出现错误！");
                                }
                            });

                        } else {
                            alert("你只能修改自己的创建的行程");
                        }
                    } else {
                        alert("你没权限修改！")
                    }
                }
            }
        })



        //        function Save() {
        //            //alert($("#IDS").text());
        //            //alert($("#time1").text());
        //            var IDS = $("#Date1").val();
        //            var time = $("#Date2").val();

        //            var persons = $("#Persons").val();
        //            var address = $("#Address").val();
        //            var theme = $("#Theme").val();
        //            var sponsor = $("#Sponsor").val();
        //            var scale = $("#Scale").val();
        //            var remark = $("#Remark").val();
        //            //alert(IDS);
        //            $.ajax({
        //                type: "Post",
        //                url: "Hanlder.aspx/updateSchedule",
        //                data: "{'ID':'" + IDS + "','time':'" + time + "','time2':'" + time2 + "','persons':'" + persons + "','address':'" + address + "','theme':'" + theme + "','sponsor':'" + sponsor + "','scale':'" + scale + "','remark':'" + remark + "'}",
        //                contentType: "application/json; charset=utf-8",
        //                async: false,
        //                dataType: "json",
        //                success: function (data) {
        //                    //alert("nihao");
        //                    if (data.d) {
        //                        alert(data.d);
        //                    } else {
        //                        //alert("删除失败")
        //                    }
        //                },
        //                error: function (err) {
        //                    alert("查询出现错误！");
        //                }
        //            });
        //        }

        //修改功能


    })
    $(".date").mobiscroll().datetime();

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
 
        //location.href = "SearchDetail.aspx?Name=" + $("#Persons").val();
     


                    
                    //$("button").parent().remove();

               
   

    //alert(GetQueryString("corpid"));
//    dd.ready(function () {
//        dd.runtime.permission.requestAuthCode({
//            corpId: GetQueryString("corpid"),
//            onSuccess: function (result) {
//                $.ajax({
//                    type: "Post",
//                    url: "Hanlder.aspx/getUserName",
//                    data: "{'Code':'" + result.code + "'}",
//                    contentType: "application/json; charset=utf-8",
//                    async: false,
//                    timeout: 30000, //超时时间设置，单位毫秒
//                    dataType: "json",
//                    success: function (data) {
//                        alert(data.d);
//                        if (data.d == "张艳") {
//                            //$("#Persons").val(data.d);
//                        } else {
//                            //$("#Persons").val(data.d);
//                            //$("#chakan").trigger("click");
//                        }
//                    },
//                    error: function (err) {
//                        alert("查询出现错误！");
//                    }
//                });
//            },
//            onFail: function (err) { }

//        })
//    });
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
        var myname = $("#myName").val();
        //alert(myname);
        //if (myname == "张艳" || myname == "沈仕满" || myname == "魏文华" || myname == "宗毅" || myname == "吴柳荷" || myname == "王刚") {
            $.ajax({
                type: "Post",
                url: "Hanlder.aspx/SaveMsg",
                data: "{'date1':'" + date1 + "','date2':'" + date2 + "','persons':'" + persons + "','add':'" + add + "','theme':'" + theme + "','sponsor':'" + sponsor + "','scale':'" + scale + "','remark':'" + remark + "'}",
                contentType: "application/json; charset=utf-8",
                async: false,
                dataType: "json",
                success: function (data) {
                    alert(data.d);
                },
                error: function (err) {
                    //alert("查询出现错误！");
                }
            });
        
    }
</script>
