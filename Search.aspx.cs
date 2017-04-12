using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ID = Request.QueryString["ID"];
       //Response.Write("<script>alert('"+ID+"')</script>");
       
        IDS.Value = ID;
        

        string Name = Request.QueryString["Name"];
        myName.Value = Name;


        string corpids = Request.QueryString["corpid"];
        corpid.Value = corpids;
        //获取所有录入记录
        //string sql = "select time,time2,users,address,theme,sponsor,scale,remark from Schedule where id="+ID;
        
        //System.Data.DataSet sqlxialaBilldr = SQLHelper.ExecuteDataSet(SQLHelper.DD, sql, System.Data.CommandType.Text);
        //for (int i = 0; i < sqlxialaBilldr.Tables[0].Rows.Count; i++)
        //{
        //    if (sqlxialaBilldr.Tables[0].Rows.Count > 0)
        //    {
        //        Date1.Value = sqlxialaBilldr.Tables[0].Rows[i][0].ToString().Trim();
        //        Date2.Value = sqlxialaBilldr.Tables[0].Rows[i][1].ToString().Trim();
        //        Persons.Value = sqlxialaBilldr.Tables[0].Rows[i][2].ToString().Trim();
        //        Address.Value = sqlxialaBilldr.Tables[0].Rows[i][3].ToString().Trim();
        //        Theme.Value = sqlxialaBilldr.Tables[0].Rows[i][4].ToString().Trim();
        //        Sponsor.Value = sqlxialaBilldr.Tables[0].Rows[i][5].ToString().Trim();
        //        Scale.Value = sqlxialaBilldr.Tables[0].Rows[i][6].ToString().Trim();
        //        Remark.Value = sqlxialaBilldr.Tables[0].Rows[i][7].ToString().Trim();

        //    }
        //}
        
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    if (Persons.Value == "")
    //    {
    //        Response.Write("<script>alert('系统正在获取用户名....')</script>");
    //    }
    //    else
    //    {
    //        if (Persons.Value == "张艳")
    //        {
                
    //            string date1 = Date1.Value;
    //            string date2 = Date2.Value;
    //            string persons = Persons.Value;
    //            string add = Address.Value;
    //            string theme = Theme.Value;
    //            string sponsor = Sponsor.Value;
    //            string scale = Scale.Value;
    //            string remark = Remark.Value;
    //            string sql = "insert into schedule(SysDate,time,time2,users,address,theme,sponsor,scale,remark) values (GETDATE(),'" + date1 + "','" + date2 + "','" + persons + "','" + add + "','" + theme + "','" + sponsor + "','" + scale + "','" + remark + "')";
    //            if (SQLHelper.ExecuteNonQuery(SQLHelper.DD, System.Data.CommandType.Text, sql) > 0)
    //            {
    //                Response.Write("<script>alert('写入成功')</script>");
    //            }
    //            else
    //            {
    //                Response.Write("<script>alert('写入失败')</script>");
    //            }
    //        }
    //        else {
    //            Response.Write("你没有权限输入！");
    //        }
    //    }
    //}
}