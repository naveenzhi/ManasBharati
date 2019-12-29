using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManasBharati
{
    public partial class photo_gallery : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();
        DataTable dtgallery = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                dtgallery = operation.get_gallery();

                if (dtgallery != null)
                {
                    RepeaterGallery.DataSource = dtgallery;
                    RepeaterGallery.DataBind();
                }
            }
        }
    }
}