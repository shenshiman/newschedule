using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;





public partial class SearchDetail : System.Web.UI.Page
{
    
    private char switchNum(char n)
    {
        switch (n)
        {
            case '0':
                {
                    return '日';
                }
            case '1':
                {
                    return '一';
                }
            case '2':
                {
                    return '二';
                }
            case '3':
                {
                    return '三';
                }
            case '4':
                {
                    return '四';
                }
            case '5':
                {
                    return '五';
                }
            case '6':
                {
                    return '六';
                }

            default:
                {
                    return 'a';
                }
        }
        
    }
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取Name

        char aa = switchNum('1');

        //Response.Write(aa);
        
        string Name = Request.QueryString["Name"];
        //string Name = NAMES.Value;
        //获取所有录入记录
        string sql = "select time,time2,users,address,theme,sponsor,scale,remark,ID from Schedule order by time";
        //SqlParameter para=new SqlParameter("Name",Name);
        DataTable dt = SQLHelper.ExecuteDataSet(SQLHelper.DD, sql, CommandType.Text).Tables[0];
        for (int i = 0; i < dt.Rows.Count; i++)
        {

            test.InnerHtml += "<li><p style='display:none;' >" + dt.Rows[i][8] + "</p><div id='sname' style='display:none;'>" + Name + "</div><span style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;width:20%;'class='dates'>" + Convert.ToDateTime(dt.Rows[i][0]).Month.ToString() + "-" + Convert.ToDateTime(dt.Rows[i][0]).Day.ToString() +  "</span>" + "<span style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;width:38%;'>" + dt.Rows[i][4].ToString() + "</span>" + "<span style='overflow:hidden;white-space:nowrap;text-overflow:ellipsis;width:38%;'>" + dt.Rows[i][3].ToString() + "</span></li>";
            //Response.Write(");
        }
    }
}

