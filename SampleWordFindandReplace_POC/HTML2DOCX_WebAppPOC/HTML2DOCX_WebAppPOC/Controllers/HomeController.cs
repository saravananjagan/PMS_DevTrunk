using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace HTML2DOCX_WebAppPOC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            StringBuilder headerString = new StringBuilder();
            var strBody = new StringBuilder();
            headerString.Append("<h1>Test Html heading</h1>");
            headerString.Append("<b>Test Html Bold</b>");
            AddFormatting(strBody, headerString.ToString());
            //D:\\SampleTemplate.docx
            StringBuilder fileName = new StringBuilder();
            fileName.Append("SampleTemplate");
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";

            Response.AddHeader("content-disposition", "attachment;filename=\"" + fileName + ".doc\"");
            Response.ContentType = "application/msword";

            // var bytes = Encoding.GetEncoding("iso-8859-1").GetBytes(templateHTMLContentString.ToString());
            //var bytes = Encoding.UTF8.GetBytes(headerString.ToString());

            Response.Write(strBody);
            Response.Flush();
            Response.End();

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        private void AddFormatting(StringBuilder strBody, string yourHtmlContent)
        {
            strBody.Append("<html " +
                "xmlns:o='urn:schemas-microsoft-com:office:office' " +
                "xmlns:w='urn:schemas-microsoft-com:office:word'" +
                "xmlns='http://www.w3.org/TR/REC-html40'>" +
                "<head><title>Time</title>");

            //The setting specifies document's view after it is downloaded as Print
            //instead of the default Web Layout
            strBody.Append("<!--[if gte mso 9]>" +
                "<xml>" +
                "<w:WordDocument>" +
                "<w:View>Print</w:View>" +
                "<w:Zoom>90</w:Zoom>" +
                "<w:DoNotOptimizeForBrowser/>" +
                "</w:WordDocument>" +
                "</xml>" +
                "<![endif]-->");

            strBody.Append("<style>" +
                "<!-- /* Style Definitions */" +
                "@page Section1" +
                "   {size:8.5in 11.0in; " +
                "   margin:1.0in 1.25in 1.0in 1.25in ; " +
                "   mso-header-margin:.5in; " +
                "   mso-footer-margin:.5in; mso-paper-source:0;}" +
                " div.Section1" +
                "   {page:Section1;}" +
                "-->" +
                "</style></head>");

            strBody.Append("<body lang=EN-US style='tab-interval:.5in'>" +
                "<div class=Section1>");
            strBody.Append(yourHtmlContent);
            strBody.Append("</div></body></html>");
        }
    }
}