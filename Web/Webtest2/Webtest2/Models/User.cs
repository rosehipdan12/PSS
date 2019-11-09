using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PSSWeb.Models
{
    public class User
    {
        public int ID { get; set; }
        public String FirstName { get; set; }
        public String LastName { get; set; }
        public int PhoneNumber { get; set; }
        public String Email { get; set; }
    }
}