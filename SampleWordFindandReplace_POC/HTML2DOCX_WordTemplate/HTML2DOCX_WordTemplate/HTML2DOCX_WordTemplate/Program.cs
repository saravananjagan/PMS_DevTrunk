using System;
using System.Text;
using System.Web;

namespace HTML2DOCX_WordTemplate
{
    class Program
    {
        static void Main(string[] args)
        {
            StringBuilder headerString = new StringBuilder();
            headerString.Append("<h1>Test Html heading</h1>");
            headerString.Append("<b>Test Html Bold</b>");
            //D:\\SampleTemplate.docx
            StringBuilder fileName = new StringBuilder();
            fileName.Append("D:\\SampleTemplate.docx");
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
        }
    }
}
