using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Webtest2
{
    public class dataModel
    {
        ICollection<category> cate;
        ICollection<item> items;
        ICollection<pet> pets;
        ICollection<supplier> sups;
        ICollection<species> specs;
        ICollection<order> orders;
        ICollection<user> users;

      public dataModel()
        {

        }
    }
}