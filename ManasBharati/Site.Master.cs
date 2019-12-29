using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManasBharati
{
    public partial class Site : System.Web.UI.MasterPage
    {
        DBOperations operation = new DBOperations();
        DataTable dtnotice = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                dtnotice = operation.get_notice();

                if (dtnotice != null)
                {
                    RepeaterNotice.DataSource = dtnotice;
                    RepeaterNotice.DataBind();
                }
            }
        }
    }
}