using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyNhaThuoc.Models
{
    public static class ImageHelper
    {
        public static MvcHtmlString Image(this HtmlHelper helper, string src = "", string width = " ", string height = " ", string alt = "")
        {
            var builder = new TagBuilder("img");
            builder.MergeAttribute("src", src);
            builder.MergeAttribute("width", width);
            builder.MergeAttribute("height", height);
            builder.MergeAttribute("alt", alt);
            return MvcHtmlString.Create(builder.ToString(TagRenderMode.SelfClosing));

        }
    }
}


//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;

//namespace QuanLyNhaThuoc.Models
//{
//    public static class ImageHelper
//    {
//        public static MvcHtmlString Image(this HtmlString helper, string src, string alt, string width, string height)
//        {
//            var builder = new TagBuilder("img");
//            builder.MergeAttribute("src", src);
//            builder.MergeAttribute("alt", alt);
//            builder.MergeAttribute("width", width);
//            builder.MergeAttribute("height", height);
//            return MvcHtmlString.Create(builder.ToString(TagRenderMode.SelfClosing));
//        }
//    }
//}