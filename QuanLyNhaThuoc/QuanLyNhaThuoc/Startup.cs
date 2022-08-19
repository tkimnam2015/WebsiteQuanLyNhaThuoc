using Microsoft.Owin;
using Owin;
using  Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using QuanLyNhaThuoc.Models;


[assembly: OwinStartupAttribute(typeof(QuanLyNhaThuoc.Startup))]
namespace QuanLyNhaThuoc
{
   
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            CreateRoleUser();
        }
        private void CreateRoleUser()
        {
            ApplicationDbContext context = new ApplicationDbContext();
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            if (!roleManager.RoleExists("Admin"))
            {
                var role = new IdentityRole();
                role.Name = "Admin";
                roleManager.Create(role);
                //role = new IdentityRole();
                //role.Name = "WebMaster";
                //roleManager.Create(role);
                //tao user
                var user = new ApplicationUser();
                user.UserName = "admin@gmail.com";
                user.Email = " admin@gmail.com";
                var check = userManager.Create(user, "123456");
                if (check.Succeeded)
                    userManager.AddToRole(user.Id, "Admin");

               user = new ApplicationUser();
                user.UserName = "dat123@gmail.com";
                user.Email = " dat123@gmail.com";
                 check = userManager.Create(user, "123456");
                if (check.Succeeded)
                    userManager.AddToRole(user.Id, "dat");
            }

        }
    }
}
