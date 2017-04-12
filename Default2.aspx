<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchDetail.aspx.cs" Inherits="SearchDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<meta content="width:device-width,initial-scale=1,user-scalable=no" name="viewport"/>
<head id="Head1" runat="server">
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

        

        function GetQueryString(name) {

            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");

            var r = window.location.search.substr(1).match(reg);

            if (r != null) return unescape(r[2]); return null;

        }

        }

        
</script>
</html>
