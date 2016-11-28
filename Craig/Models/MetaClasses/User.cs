using Craig.Helpers;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Craig.Models
{
    [MetadataType(typeof(UserMetaData))]
    public partial class User
    {
    }

    public class UserMetaData
    {
        [Required]
        [StringLength(20, ErrorMessage = "Username is too long! Maxmimum of 20 characters.")]
        public string Username { get; set; }

        [Required]
        [StringLength(20, ErrorMessage = "Password is too long! Maxmimum of 20 characters.")]
        public string Password { get; set; }

        [Required]
        [Display(Name = "First Name")]
        [StringLength(20, ErrorMessage = "FirstName is too long! Maxmimum of 20 characters.")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        [StringLength(20, ErrorMessage = "LastName is too long! Maxmimum of 20 characters.")]
        public string LastName { get; set; }

        [Required]
        [StringLength(50, ErrorMessage = "Email is too long! Maxmimum of 50 characters.")]
        public string Email { get; set; }

        [Required]
        [Display(Name = "Emp Number")]
        [ValidInteger(ErrorMessage = "Must be an Integer!")]
        [Range(1, int.MaxValue, ErrorMessage = "Employee Number is too long! Maximum of 5 characters.")]
        public string EmployeeNumber { get; set; }

        [Required]
        [Display(Name = "Craig Role")]
        public string CraigRole { get; set; }

        [Required]
        [Display(Name = "Server List Role")]
        public string ServerListRole { get; set; }
    }
}