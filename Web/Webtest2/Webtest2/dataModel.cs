using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Webtest2
{
    public class dataModel
    {
       public ICollection<category> cate;
        public ICollection<item> items;
        public ICollection<pet> pets;
        public ICollection<supplier> sups;
        public ICollection<species> specs;
        public ICollection<order> orders;
        public ICollection<user> users;

      public dataModel()
        {
            
        }

        public ICollection<category> Cate { get => cate; set => cate = value; }
        public ICollection<item> Items { get => items; set => items = value; }
        public ICollection<pet> Pets { get => pets; set => pets = value; }
        public ICollection<supplier> Sups { get => sups; set => sups = value; }
        public ICollection<species> Specs { get => specs; set => specs = value; }
        public ICollection<order> Orders { get => orders; set => orders = value; }
        public ICollection<user> Users { get => users; set => users = value; }
    }
}