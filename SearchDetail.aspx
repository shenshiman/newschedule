<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchDetail.aspx.cs" Inherits="SearchDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<meta content="width:device-width,initial-scale=1,user-scalable=no" name="viewport"/>
<head runat="server">
    <title></title>
    <style type="text/css">
        *
        {
            margin:0;
            padding:0;
            list-style:none;
            font-size:1rem;
            }
        #test 
        {
            width:100%;
            height:100%;
           
            }
         #test  li
            {
                width:100%;
                height:40px;
                 color:#000;
                
                }
        #test li:first-child
         {
             background:#32A5F7;
             color:#fff;
             }    
            
        #test li span
         {
             width:32%;
             text-align:center;
             height:40px;
             line-height:40px;
             display:inline-block;
             
            
             } 
              
             h1
             {
                 display:none;} 
          .con
          {
              
              width:100%;
              
              position:fixed;
              top:0;
              background:#fff;
              }  
           .con ul 
           {
               width:95%;
               margin:0 auto;
               }  
            .con ul li
            {
               min-height:40px;   
               border:1px solid #32A5F7; 
               margin-top:2px;
               border-radius:5px; 
                     
            }   
            .con ul li span:nth-child(odd)
            {
                background:#32A5F7;
                color:#fff;
                width:30%;
                min-height:40px;
                line-height:40px;
                text-align:center;
                display:block;
                float:left;
                }
            .con ul li span:nth-child(even)
            {
                width:68%;
                min-height:40px;
                line-height:40px;
                text-align:center;
                display:block;
                float:right;
                font-size:0.8rem;
                display:block;
                }    
           .con input
           {
               position:absolute;
               bottom:0;
               left:50%;
               width:100px;
               height:30px;
               margin-left:-50px;
               background:#32A5F7;
               color:#fff;
               border:none;
               }
               
          input[type="button"], input[type="submit"], input[type="reset"] 
          {
                -webkit-appearance: none;
               }                  
    </style>
    <script src="https://g.alicdn.com/ilw/ding/0.6.6/scripts/dingtalk.js" type="text/javascript"></script>
    <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
    <script src="js/jquery.mobile-1.4.3.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <input type="text" ID="NAMES" runat="server" style="display:none;"/>
    <center>
    <ul id="test" runat="server">
        <li style=""><span style="width:20%;">时间</span><span style="width:38%;">主题</span><span style="width:38%;">地点</span></li>
        
    </ul>
    <button  id="bjan">添加行程</button>
    </center>
    
    </form>
</body>
<script type="text/javascript">

//    $("li:gt(0)").taphold(function () {
//        
//       
//        if (confirm("是否删除该行数据")) {

//            //alert($(this).find("p").text());
//            $.ajax({
//                type: "Post",
//                url: "Hanlder.aspx/deleteExpressage",
//                data: "{'ID':'" + $(this).find("p").text() + "'}",
//                contentType: "application/json; charset=utf-8",
//                async: false,
//                dataType: "json",
//                success: function (data) {
//                    if (data.d) {
//                        window.location.reload();
//                    } else {
//                        //alert("删除失败")
//                    }
//                },
//                error: function (err) {
//                    //alert("查询出现错误！");
//                }
//            });
//        } else {
//            //alert("bb")

//        }
    //    })

    //var hh = document.documentElement.cilentHeight;
    //document.body.style.height = hh + "px";
    //$(".con").css("height", 500 + 'px');
    window.onload = function () {
        dd.ready(function () {
            dd.runtime.permission.requestAuthCode({
                corpId: GetQueryString("corpid"),
                onSuccess: function (result) {
                    $.ajax({
                        type: "Post",
                        url: "Hanlder.aspx/getUserName",
                        data: "{'Code':'" + result.code + "'}",
                        contentType: "application/json; charset=utf-8",
                        async: false,
                        timeout: 30000, //超时时间设置，单位毫秒
                        dataType: "json",
                        success: function (data) {
                            alert(data.d);
                            $("#NAMES").val(data.d);
                            //alert($("#NAMES").val());
                            if (data.d == "张艳" || data.d == "沈仕满" || data.d == "魏文华" || data.d == "宗毅" || data.d == "吴柳荷" || data.d == "王刚") {
                                //alert("a");
                            } else {
                                //alert("a")
                                $("#bjan").css("display", "none");
                            }
                            $("#bjan").click(function () {
                                if (data.d == "张艳" || data.d == "沈仕满" || data.d == "魏文华" || data.d == "宗毅" || data.d == "吴柳荷" || data.d == "王刚") {
                                    //alert("a");
                                    location.href = "Default.aspx?Name=" + $("#NAMES").val();
                                } else {
                                    alert("你没有权限编辑");
                                }
                            })

                        },
                        error: function (err) {
                            alert("查询出现错误！");
                        }
                    });
                },
                onFail: function (err) { }

            })
        });

        //alert($("#NAMES").val());

        //获取钉用户名
        /* dd.ready(function () {
        dd.runtime.permission.requestAuthCode({
        corpId: GetQueryString("corpid"),
        onSuccess: function (result) {
        $.ajax({
        type: "Post",
        url: "Hanlder.aspx/getUserName",
        data: "{'Code':'" + result.code + "'}",
        contentType: "application/json; charset=utf-8",
        async: false,
        timeout: 30000, //超时时间设置，单位毫秒
        dataType: "json",
        success: function (data) {
        //alert(data.d);
        $("#NAMES").val(data.d);
                        
        if (data.d == "张艳" || data.d == "沈仕满" || data.d == "魏文华" || data.d == "宗毅" || data.d == "吴柳荷") {
        //alert("a");
        location.href = "Default.aspx?Name=" + $("#NAMES").val();
        } else {
        //alert("aa");
        }
                        
        },
        error: function (err) {
        alert("查询出现错误！");
        }
        });
        },
        onFail: function (err) { }

        })
        });*/

        function GetQueryString(name) {

            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");

            var r = window.location.search.substr(1).match(reg);

            if (r != null) return unescape(r[2]); return null;

        }



        $(function () {
            var hh = document.documentElement.clientHeight;
            document.body.style.height = hh + "px";
            //$(".con").css("height", hh+10 + 'px');
            //alert(hh);

            $("li:gt(0)").click(function () {
                //$(".con").remove();
                //alert("a");
                var a = '';
                $(".con").css("display", "none");
                //$("#con").css("height", hh + 'px');
                //alert($(this).find("p").text());
                var ids = $(this).find("p").text();
                $.ajax({
                    type: "Post",
                    url: "Hanlder.aspx/ShowDetailDD",

                    data: "{'ID':'" + $(this).find("p").text() + "'}",
                    contentType: "application/json;charset=utf-8",
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        //alert(data.d);
                        $(data.d).each(function () {
                            a += '<ul><div id="IDS" style="display:none;">' + ids + '</div><li>' + '<span>开始时间：</span><span contenteditable="true" id="time1">' + this.time + '</span></li>' + '<li><span>结束时间：</span><span id="time2" contenteditable="true">' + this.time2 + '</span></li>' + '<li><span>录入人：</span><span id="users" contenteditable="true">' + this.users + '</span></li>'
                    + '<li><span>地点：</span><span id="address" contenteditable="true">' + this.address + '</span></li>' + '<li><span>主题：</span><span id="theme" contenteditable="true">' + this.theme + '</span></li>' + '<li><span>主办方：</span><span id="sponsor" contenteditable="true">' + this.sponsor + '</span></li>'
                    + '<li><span>规模：</span><span id="scale" contenteditable="true">' + this.scale + '</span></li>' + '<li><span>备注：</span><span id="remark" contenteditable="true">' + this.remark + '</span></li>' + '<li style="border:none;"><div id="close" style="background:red;color:#fff;text-align:center;line-height:40px;width:50%;display:inline-block;">关闭</div><div id="save" style="width:50%;display:inline-block;background:#32A5F7;color:#fff;text-align:center;line-height:40px;margin-top:8px;">保存</div></li></ul>';
                            //alert(a);
                        })

                        $("<div class='con' id='con'></div>").appendTo($("body"));
                        $(".con").append(a);
                        $("#con").css("height", hh + 'px');
                        $("#close").click(function () {
                            $(".con").remove();
                        })
                        //alert(hh);

                        //修改功能
                        $("#save").click(function () {
                            //alert($("#IDS").text());
                            //alert($("#time1").text());
                            var IDS = $("#IDS").text();
                            var time = $("#time1").text();
                            var time2 = $("#time2").text();
                            var persons = $("#users").text();
                            var address = $("#address").text();
                            var theme = $("#theme").text();
                            var sponsor = $("#sponsor").text();
                            var scale = $("#scale").text();
                            var remark = $("#remark").text();
                            //alert(address);
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
                                        //alert("删除失败")
                                    }
                                },
                                error: function (err) {
                                    alert("查询出现错误！");
                                }
                            });
                        })

                    },
                    error: function (err) {
                    }
                    //$("button").parent().remove();

                })

            })
            //日期超过隐藏
            var mydate = new Date();
            var mouth = mydate.getMonth() + 1;
            //var day = mydate.getDay();
            var date = mydate.getDate();
            //alert(day);
            $(".dates").each(function () {
                //alert($(this).text());
                var mouths = $(this).text().split("-")[0];
                var days = $(this).text().split("-")[1];
                var _this = this;
                if (mouths < mouth) {
                    $(_this).parent().css("display", "none");
                } else if (mouths == mouth) {
                    if (days < date) {
                        $(_this).parent().css("display", "none");
                    }
                }


            });



            //alert(mouth);
            //if()

            $("li:gt(0):odd").css("background", "#B2D5EF");


            $("li:gt(0)").taphold(function () {//长按删除功能
                //e.stopPropagation();
                //e.preventDefault();
                //alert("aa");
                //alert($("#NAMES").val());
                //alert($("#NAMES").val());

                if ($("#NAMES").val() == "张艳" || $("#NAMES").val() == "宗毅" || $("#NAMES").val() == "吴柳荷" || $("#NAMES").val() == "魏文华" || $("#NAMES").val() == "沈仕满" || $("#NAMES").val() == "王刚") {
                    if (confirm("是否删除该行数据")) {

                        //alert($(this).find("p").text());
                        $.ajax({
                            type: "Post",
                            url: "Hanlder.aspx/deleteSchedule",
                            data: "{'ID':'" + $(this).find("p").text() + "'}",
                            contentType: "application/json; charset=utf-8",
                            async: false,
                            dataType: "json",
                            success: function (data) {
                                if (data.d) {
                                    window.location.reload();
                                } else {
                                    //alert("删除失败")
                                }
                            },
                            error: function (err) {
                                //alert("查询出现错误！");
                            }
                        });
                    } else {
                        //alert("bb")

                    }

                } else {
                    alert("你没有权限删除！");
                }

            })

        })
    }
</script>
</html>
