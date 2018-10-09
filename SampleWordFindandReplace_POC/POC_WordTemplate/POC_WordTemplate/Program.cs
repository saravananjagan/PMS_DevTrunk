using iTextSharp.text;
using iTextSharp.text.pdf.draw;
using System;
//please note that using this requires ms office in server.
namespace POC_WordTemplate
{
    class Program
    {
        static void Main(string[] args)
        {
            Microsoft.Office.Interop.Word.Application wordApp = new Microsoft.Office.Interop.Word.ApplicationClass();
            Object MISSING = System.Reflection.Missing.Value;
            Microsoft.Office.Interop.Word.Document aDoc = null;
            aDoc = wordApp.Documents.Open("D:\\SampleTemplate.docx");
            wordApp.Visible = false;
            FindAndReplace(wordApp, "<name>", "Test Name");
            wordApp.ActiveDocument.Characters.Last.Select();
            Microsoft.Office.Interop.Word.Selection selection = wordApp.Selection;
            Microsoft.Office.Interop.Word.Range range = selection.Range;
            Microsoft.Office.Interop.Word.Bookmarks bookmarks = aDoc.Bookmarks;
            int count = bookmarks.Count;
            Microsoft.Office.Interop.Word.Bookmark bookmark = bookmarks.Add("bookmark2",range);
            wordApp.Selection.Collapse();
            wordApp.Selection.TypeText("appended text........");
            aDoc.Save();
            aDoc.Close();
            Console.WriteLine("Hello World!");
        }
        private static void FindAndReplace(Microsoft.Office.Interop.Word.Application WordApp, object findText, object replaceWithText)
        {
            object matchCase = true;
            object matchWholeWord = true;
            object matchWildCards = false;
            object matchSoundsLike = false;
            object nmatchAllWordForms = false;
            object forward = true;
            object format = false;
            object matchKashida = false;
            object matchDiacritics = false;
            object matchAlefHamza = false;
            object matchControl = false;
            object read_only = false;
            object visible = true;
            object replace = 2;
            object wrap = Microsoft.Office.Interop.Word.WdFindWrap.wdFindContinue;
            object replaceAll = Microsoft.Office.Interop.Word.WdReplace.wdReplaceAll;
            WordApp.Selection.Find.Execute(ref findText, ref matchCase, ref matchWholeWord, ref matchWildCards, ref matchSoundsLike,
            ref nmatchAllWordForms, ref forward,
            ref wrap, ref format, ref replaceWithText,
            ref replaceAll, ref matchKashida,
            ref matchDiacritics, ref matchAlefHamza,
            ref matchControl);
        }
    }
}
