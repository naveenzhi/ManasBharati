using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManasBharati
{
    public partial class index : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();
        DataSet dsindex = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                dsindex = operation.BindHomepage();

                if (dsindex != null)
                {
                    RepeaterGallery.DataSource = dsindex.Tables[0];
                    RepeaterGallery.DataBind();
                    RepeaterTestimonial.DataSource = dsindex.Tables[1];
                    RepeaterTestimonial.DataBind();
                    RepeaterTestimonialIndicator.DataSource = dsindex.Tables[1];
                    RepeaterTestimonialIndicator.DataBind();
                    RepeaterBanner.DataSource = dsindex.Tables[2];
                    RepeaterBanner.DataBind();
                    RepeaterBannerIndicator.DataSource = dsindex.Tables[2];
                    RepeaterBannerIndicator.DataBind();
                }
            }
        }
    }
}