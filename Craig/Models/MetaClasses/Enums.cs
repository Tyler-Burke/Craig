using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Craig.Models.MetaClasses
{
    public enum Roles
    {
        Operator = 1,
        ApplicationSupport = 2,
        Tech = 3,
        Admin = 4,
        SuperAdmin = 5,
    }
}